//
//  CharactersApiClient.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import BrightFutures

public class CharactersApiClient : BaseApiClient {

    private let parser: CharactersParser

    init(baseEndpoint: String, timeProvider: TimeProvider, httpClient: HttpClient, parser: CharactersParser) {
        self.parser = parser
        super.init(baseEndpoint: baseEndpoint, timeProvider: timeProvider, httpClient: httpClient)
    }
    
    public func getAll(offset: Int, limit: Int) -> Future<GetCharactersDTO,NSError> {
        print("Get all with offset plus limit")
        let params = [MarvelApiParams.Offset : "\(offset)", MarvelApiParams.Limit : "\(limit)"]
        return sendRequest(.GET, path: "characters",params: params).map { response in
            return self.parser.fromString(response.body)
        }
    }
    
}
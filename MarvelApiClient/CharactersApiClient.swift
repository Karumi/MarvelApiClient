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

    init(timeProvider: TimeProvider, httpClient: HttpClient, parser: CharactersParser) {
        self.parser = parser
        super.init(timeProvider: timeProvider, httpClient: httpClient)
    }
    
    public func getAll() -> Future<GetCharactersDTO,NSError> {
        return sendRequest(.GET, path: "characters").map { response in
            return self.parser.fromString(response.body)
        }
    }
    
}
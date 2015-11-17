//
//  CharactersApiClient.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import BrightFutures

public class CharactersApiClient: BaseApiClient {

    private let parser: CharactersParser

    init(baseEndpoint: String, timeProvider: TimeProvider, httpClient: HttpClient, parser: CharactersParser) {
        self.parser = parser
        super.init(baseEndpoint: baseEndpoint, timeProvider: timeProvider, httpClient: httpClient)
    }

    public func getAll(offset: Int, limit: Int) -> Future<GetCharactersDTO, NSError> {
        let params = [MarvelApiParams.offset : "\(offset)", MarvelApiParams.limit : "\(limit)"]
        return sendRequest(.GET, path: "characters",params: params).map { response in
            return self.parser.fromData(response.body)
        }
    }

    public func getById(id: String) -> Future<CharacterDTO, NSError> {
        return sendRequest(.GET, path: "characters/\(id)").map { response in
            return self.parser.characterDTOFromData(response.body)
        }

    }

}
//
//  CharactersApiClient.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import BrightFutures

public class CharactersApiClient {

    private let apiClient: MarvelBaseApiClient
    private let parser: CharactersParser

    init(apiClient: MarvelBaseApiClient, parser: CharactersParser) {
        self.parser = parser
        self.apiClient = apiClient
    }
    
    public func getAll(offset: Int, limit: Int) -> Future<GetCharactersDto,NSError> {
        let params = [MarvelApiParams.Offset : "\(offset)", MarvelApiParams.Limit : "\(limit)"]
        return apiClient.sendRequest(.GET, path: "characters",params: params).map { response in
            return self.parser.fromData(response.body)
        }
    }

    public func getById(id: String) -> Future<CharacterDto,NSError> {
        return apiClient.sendRequest(.GET, path: "characters/\(id)").map { response in
            return self.parser.characterDTOFromData(response.body)
        }

    }
    
}
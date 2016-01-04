//
//  CharactersApiClient.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import BothamNetworking
import Result

public class CharactersApiClient {

    private let apiClient: BothamAPIClient
    private let parser: CharactersParser

    init(apiClient: BothamAPIClient, parser: CharactersParser) {
        self.parser = parser
        self.apiClient = apiClient
    }

    public func getAll(offset: Int, limit: Int, completition: (Result<GetCharactersDTO, BothamAPIClientError>) -> ()) {
        assert(offset >= 0 && limit >= offset)
        let params = [MarvelApiParams.offset : "\(offset)", MarvelApiParams.limit : "\(limit)"]
        return apiClient.GET("characters", parameters: params) { response in
            if let response = response.value {
                completition(Result.Success(self.parser.fromData(response.body)))
            } else if let error = response.error {
                completition(Result.Failure(error))
            }
        }
    }

    public func getById(id: String, completition: (Result<CharacterDTO, BothamAPIClientError>) -> ()) {
        return apiClient.GET("characters/\(id)") { response in
            if let response = response.value {
                completition(Result.Success(self.parser.characterDTOFromData(response.body)))
            } else if let error = response.error {
                completition(Result.Failure(error))
            }
        }

    }

}
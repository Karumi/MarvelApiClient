//
//  SeriesAPIClient.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 07/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation
import BothamNetworking
import Result

public class SeriesAPIClient {

    private let apiClient: BothamAPIClient
    private let parser: SeriesParser

    init(apiClient: BothamAPIClient, parser: SeriesParser) {
        self.apiClient = apiClient
        self.parser = parser
    }

    public func getAll(offset: Int, limit: Int,
                       completion: @escaping (Result<GetSeriesDTO, BothamAPIClientError>) -> Void) {
            assert(offset >= 0 && limit >= 0)
            let params =  [MarvelAPIParams.offset: "\(offset)", MarvelAPIParams.limit: "\(limit)"]
            apiClient.GET("series", parameters: params) { response in
                completion(
                    response.mapJSON {
                        return self.parser.fromJSON(json: $0)
                    }
                )
            }
    }

    public func getComics(seriesId: String, offset: Int, limit: Int,
                          completion: @escaping (Result<GetComicsDTO, BothamAPIClientError>) -> Void) {
            assert(offset >= 0 && limit >= 0)
            let params =  [MarvelAPIParams.offset: "\(offset)", MarvelAPIParams.limit: "\(limit)"]
            apiClient.GET("series/\(seriesId)/comics", parameters: params) { response in
                completion(
                    response.mapJSON {
                        return self.parser.getComicsDTOFromJSON(json: $0)
                    }
                )
            }

    }

}

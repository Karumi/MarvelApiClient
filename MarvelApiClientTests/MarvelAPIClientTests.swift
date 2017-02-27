//
//  MarvelAPIClientTests.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 07/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation
import BothamNetworking
import Nocilla
@testable import MarvelAPIClient

class MarvelAPIClientTests: NocillaTestCase {

    private let marvelBaseEndpoint = "http://gateway.marvel.com/v1/public/"
    private let anyPublicKey = "1234"
    private let anyPrivateKey = "abcd"

    func givenABothamAPIClient() -> BothamAPIClient {
        let apiClient = BothamAPIClient(baseEndpoint: marvelBaseEndpoint)
        apiClient.requestInterceptors.append(DefaultHeadersRequestInterceptor())
        let timeProvider = MockTimeProvider(time: 1)
        apiClient.requestInterceptors.append(MarvelAPIAuthentication(timeProvider: timeProvider))
        MarvelAPIClient.publicKey = anyPublicKey
        MarvelAPIClient.privateKey = anyPrivateKey
        return apiClient
    }
}

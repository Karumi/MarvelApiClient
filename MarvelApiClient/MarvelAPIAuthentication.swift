//
//  MarvelAPIAuthentication.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 04/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation
import BothamNetworking

class MarvelAPIAuthentication: BothamRequestInterceptor {

    private let timeProvider: TimeProvider

    init(timeProvider: TimeProvider) {
        self.timeProvider = timeProvider
    }

    func intercept(_ request: HTTPRequest) -> HTTPRequest {
        let timestamp = timeProvider.currentTimeMillis()
        let privateKey = MarvelAPIClient.privateKey
        let publicKey = MarvelAPIClient.publicKey
        let hash = MarvelHashGenerator.generateHash(timestamp: Int(timestamp),
                                                    privateKey: privateKey,
                                                    publicKey: publicKey)
        let authParams = [MarvelAPIParams.timestamp: "\(timestamp)",
            MarvelAPIParams.apiKey: publicKey,
            MarvelAPIParams.hash: hash]
        return request.appendingParameters(authParams)
    }

}

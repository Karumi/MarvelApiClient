//
//  DefaultHeadersRequestInterceptor.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 04/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation
import BothamNetworking

class DefaultHeadersRequestInterceptor: BothamRequestInterceptor {

    func intercept(_ request: HTTPRequest) -> HTTPRequest {
        let defaultHeaders = MarvelAPIClientConfig.defaultHeaders.filter {
            return request.headers?[$0.0] == nil
        }
        return request.appendingHeaders(Dictionary(defaultHeaders))
    }

}

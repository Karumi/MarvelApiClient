//
//  DefaultHeadersRequestInterceptor.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente Gomez on 04/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation
import BothamNetworking

class DefaultHeadersRequestInterceptor: BothamRequestInterceptor {

    func intercept(request: HTTPRequest) -> HTTPRequest {
        let defaultHeaders = MarvelAPIClientConfig.defaultHeaders
        return request.appendingHeaders(defaultHeaders)
    }

}

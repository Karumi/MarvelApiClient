//
//  DefaultHeadersRequestInterceptorTests.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 05/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation
import XCTest
import Nimble
import BothamNetworking
@testable import MarvelAPIClient

class DefaultHeadersRequestInterceptorTests: XCTestCase {

    func testShouldAddAcceptAndContentTypeHeadersByDefault() {
        let interceptor = DefaultHeadersRequestInterceptor()
        let request = givenAHTTPRequest()

        let interceptedRequest = interceptor.intercept(request)

        expect(interceptedRequest.headers?.count).to(equal(2))
        expect(interceptedRequest.headers?["Accept"]).to(equal("application/json"))
        expect(interceptedRequest.headers?["Content-Type"]).to(equal("application/json"))
    }

    func testShouldNotOverrideHTTPRequestHeaders() {
        let interceptor = DefaultHeadersRequestInterceptor()
        let request = givenAHTTPRequest(withHeaders: ["Content-Type":"application/x-www-form-urlencoded"])

        let interceptedRequest = interceptor.intercept(request)

        expect(interceptedRequest.headers?.count).to(equal(2))
        expect(interceptedRequest.headers?["Accept"]).to(equal("application/json"))
        expect(interceptedRequest.headers?["Content-Type"]).to(equal("application/x-www-form-urlencoded"))
    }

    private func givenAHTTPRequest(withHeaders headers: [String:String]? = nil)
        -> HTTPRequest {
            return HTTPRequest(url: "http://www.karumi.com",
                parameters: nil,
                headers: headers,
                httpMethod: .GET,
                body: nil)
    }

}

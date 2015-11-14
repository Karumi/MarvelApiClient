//
//  AlamofireHttpClientTests.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente Gomez on 12/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import XCTest
import Nocilla
import Nimble
import BrightFutures
import Result
@testable import MarvelApiClient

class AlamofireHttpClientTests : XCTestCase {

    private let nocilla: LSNocilla = LSNocilla.sharedInstance()

    private let anyUrl = "http://www.any.com"
    private let anyStatusCode = 201
    private let anyBody = "HttpResponseBody"
    private let anyError = NSError(domain: "DomainError", code: 123, userInfo: nil)

    override func setUp() {
        super.setUp()
        nocilla.start()
    }

    override func tearDown() {
        nocilla.clearStubs()
        nocilla.stop()
        super.tearDown()
    }

    func testSendsGetRequestToAnyPath() {
        stubRequest("GET", anyUrl)
        let httpClient = AlamofireHttpClient()
        let request = givenOneHttpRequest(.GET, url: anyUrl)

        let result = httpClient.send(request)

        expect(result).toEventually(beSuccess())
    }

    func testSendsPostRequestToAnyPath() {
        stubRequest("POST", anyUrl)
        let httpClient = AlamofireHttpClient()
        let request = givenOneHttpRequest(.POST, url: anyUrl)

        let result = httpClient.send(request)

        expect(result).toEventually(beSuccess())
    }

    func testSendsPutRequestToAnyPath() {
        stubRequest("PUT", anyUrl)
        let httpClient = AlamofireHttpClient()
        let request = givenOneHttpRequest(.PUT, url: anyUrl)

        let result = httpClient.send(request)

        expect(result).toEventually(beSuccess())
    }

    func testSendsDeleteRequestToAnyPath() {
        stubRequest("DELETE", anyUrl)
        let httpClient = AlamofireHttpClient()
        let request = givenOneHttpRequest(.DELETE, url: anyUrl)

        let result = httpClient.send(request)

        expect(result).toEventually(beSuccess())
    }

    func testReceivesHttpStatusCodeInTheHttpResponse() {
        stubRequest("GET", anyUrl).andReturn(anyStatusCode)
        let httpClient = AlamofireHttpClient()
        let request = givenOneHttpRequest(.GET, url: anyUrl)

        let result = httpClient.send(request)

        expect(result).toEventually(beSuccess())
    }

    func testReceivesResponseBodyInTheHttpResponse() {
        stubRequest("GET", anyUrl).andReturn(200).withBody(anyBody)
        let httpClient = AlamofireHttpClient()
        let request = givenOneHttpRequest(.GET, url: anyUrl)

        let result = httpClient.send(request)

        expect(result).toEventually(containsBody(anyBody))
    }

    func testPropagatesErrorsInTheFuture() {
        stubRequest("GET", anyUrl).andFailWithError(anyError)
        let httpClient = AlamofireHttpClient()
        let request = givenOneHttpRequest(.GET, url: anyUrl)

        let result = httpClient.send(request)

        expect(result).toEventually(failWithError(anyError))
    }

    func testSendsParamsConfiguredInTheHttpRequest() {
        stubRequest("GET", "http://www.any.com/?key=value")
        let httpClient = AlamofireHttpClient()
        let request = givenOneHttpRequest(.GET, url: "http://www.any.com/", params: ["key" : "value"])

        let result = httpClient.send(request)

        expect(result).toEventually(beSuccess())
    }

    private func givenOneHttpRequest(httpVerb: HttpVerb, url: String, params: [String:String]? = nil, headers: [String:String]? = nil) -> HttpRequest {
        return HttpRequest(url: url, parameters: params, headers: headers, verb: httpVerb)
    }

    private func containsBody<T>(expectedBody: String) -> MatcherFunc<T?> {
        return MatcherFunc { actualExpression, failureMessage in
            failureMessage.postfixMessage = "contains body"
            let future = try actualExpression.evaluate() as! Future<HttpResponse,NSError>
            if let result = future.result?.value {
                return result.body == expectedBody
            } else {
                return false
            }
        }
    }
}
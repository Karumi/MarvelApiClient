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
        let getRequest = givenOneHttpRequest(.GET, url: anyUrl)

        var requestFinished = false
        httpClient.send(getRequest).onSuccess { httpResponse in
            requestFinished = true
        }

        expect(requestFinished).toEventually(beTrue())
    }

    func testSendsPostRequestToAnyPath() {
        stubRequest("POST", anyUrl)
        let httpClient = AlamofireHttpClient()
        let getRequest = givenOneHttpRequest(.POST, url: anyUrl)

        var requestFinished = false
        httpClient.send(getRequest).onSuccess { httpResponse in
            requestFinished = true
        }

        expect(requestFinished).toEventually(beTrue())
    }

    func testSendsPutRequestToAnyPath() {
        stubRequest("PUT", anyUrl)
        let httpClient = AlamofireHttpClient()
        let getRequest = givenOneHttpRequest(.PUT, url: anyUrl)

        var requestFinished = false
        httpClient.send(getRequest).onSuccess { httpResponse in
            requestFinished = true
        }

        expect(requestFinished).toEventually(beTrue())
    }

    func testSendsDeleteRequestToAnyPath() {
        stubRequest("DELETE", anyUrl)
        let httpClient = AlamofireHttpClient()
        let getRequest = givenOneHttpRequest(.DELETE, url: anyUrl)

        var requestFinished = false
        httpClient.send(getRequest).onSuccess { httpResponse in
            requestFinished = true
        }

        expect(requestFinished).toEventually(beTrue())
    }

    func testReceivesHttpStatusCodeInTheHttpResponse() {
        stubRequest("GET", anyUrl).andReturn(anyStatusCode)
        let httpClient = AlamofireHttpClient()
        let getRequest = givenOneHttpRequest(.GET, url: anyUrl)

        var statusCode = 0
        httpClient.send(getRequest).onSuccess { httpResponse in
            statusCode = httpResponse.statusCode
        }

        expect(statusCode).toEventually(equal(anyStatusCode))
    }

    func testReceivesResponseBodyInTheHttpResponse() {
        stubRequest("GET", anyUrl).andReturn(200).withBody(anyBody)
        let httpClient = AlamofireHttpClient()
        let getRequest = givenOneHttpRequest(.GET, url: anyUrl)

        var body = ""
        httpClient.send(getRequest).onSuccess { httpResponse in
            body = httpResponse.body!
        }

        expect(body).toEventually(equal(anyBody))
    }

    func testPropagatesErrorsInTheFuture() {
        stubRequest("GET", anyUrl).andFailWithError(anyError)
        let httpClient = AlamofireHttpClient()
        let getRequest = givenOneHttpRequest(.GET, url: anyUrl)

        var error: NSError = NSError(domain: "", code: 0, userInfo: nil)
        httpClient.send(getRequest).onFailure { httpError in
            error = httpError
        }

        expect(error).toEventually(equal(anyError))
    }

    func testSendsParamsConfiguredInTheHttpRequest() {
        stubRequest("GET", "http://www.any.com/?key=value")
        let httpClient = AlamofireHttpClient()
        let getRequest = givenOneHttpRequest(.GET, url: "http://www.any.com/", params: ["key" : "value"])

        var requestFinished = false
        httpClient.send(getRequest).onSuccess { httpResponse in
            requestFinished = true
        }

        httpClient.send(getRequest)

        expect(requestFinished).toEventually(beTrue())
    }

    private func givenOneHttpRequest(httpVerb: HttpVerb, url: String, params: [String:String]? = nil, headers: [String:String]? = nil) -> HttpRequest {
        return HttpRequest(url: url, parameters: params, headers: headers, verb: httpVerb)
    }

}
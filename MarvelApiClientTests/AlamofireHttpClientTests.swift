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

    private let anyUrl = "www.any.com"

    override func setUp() {
        nocilla.start()
    }

    override func tearDown() {
        nocilla.clearStubs()
        nocilla.stop()
    }

    func testSendsGetRequestToAnyPath() {
        stubRequest("GET", anyUrl)
        let httpClient = AlamofireHttpClient()

        var requestFinished = false
        let getRequest = givenOneHttpRequest(.GET, url: anyUrl)
        httpClient.send(getRequest).onSuccess { (httpResponse) -> Void in
            requestFinished = true
        }

        expect(requestFinished).toEventually(beTrue())
    }

    private func givenOneHttpRequest(httpVerb: HttpVerb, url: String) -> HttpRequest {
        let anyParams = [String : String]()
        let anyHeaders = [String : String]()
        return HttpRequest(url: url, parameters: anyParams, headers: anyHeaders, verb: httpVerb)
    }

}
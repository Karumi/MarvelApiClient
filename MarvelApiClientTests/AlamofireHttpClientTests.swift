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
@testable import MarvelApiClient

class AlamofireHttpClientTests : XCTestCase {

    func testSendsGetRequestToAnyPath() {
        let httpClient = AlamofireHttpClient()
        let getRequest = givenOneHttpRequest(.GET)

        httpClient.send(getRequest)
    }

    private func givenOneHttpRequest(httpVerb: HttpVerb) -> HttpRequest {
        let anyUrl = ""
        let anyParams = [String : String]()
        let anyHeaders = [String : String]()
        return HttpRequest(url: anyUrl, parameters: anyParams, headers: anyHeaders, verb: httpVerb)
    }

}
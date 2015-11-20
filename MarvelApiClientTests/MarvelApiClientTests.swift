//
//  MarvelApiClientTests.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente Gomez on 16/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
@testable import MarvelApiClient

class MarvelApiClientTests: NocillaTestCase {

    private let anyPath = "path"
    private let anyPublicKey = "1234"
    private let anyPrivateKey = "abcd"
    private let anyTimestamp = 1

    var timeProvider: MockTimeProvider!
    var httpClient: HTTPClient!

    override func setUp() {
        super.setUp()
        MarvelApiClient.configureCredentials(anyPublicKey, privateKey: anyPrivateKey)
        timeProvider = MockTimeProvider(time: anyTimestamp)
        httpClient = AlamofireHTTPClient()
    }

    override func tearDown() {
        MarvelApiClient.configureCredentials("", privateKey: "")
        super.tearDown()
    }

}
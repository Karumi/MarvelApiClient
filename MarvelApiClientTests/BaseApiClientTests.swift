//
//  BaseApiClientTests.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import XCTest
import Nocilla
import Nimble
import BrightFutures
import Result
@testable import MarvelApiClient

class BaseApiClientTests : XCTestCase {

    private let anyPath = "path"
    private let anyPublicKey = "1234"
    private let anyPrivateKey = "abcd"
    private var timeProvider: MockTimeProvider!
    private var httpClient: HttpClient!
    private let nocilla: LSNocilla = LSNocilla.sharedInstance()
    
    override func setUp() {
        super.setUp()
        timeProvider = MockTimeProvider()
        httpClient = AlamofireHttpClient()
        nocilla.start()
    }
    
    override func tearDown() {
        MarvelApiClient.configureCredentials("", privateKey: "")
        nocilla.clearStubs()
        nocilla.stop()
        super.tearDown()
    }
    
    func testSendsAuthParamsByDefault() {
        let apiClient = BaseApiClient(timeProvider: timeProvider, httpClient: httpClient)
        givenCredentialsConfigured(anyPublicKey, privateKey: anyPrivateKey)
        givenCurrentTimeIs(1)
        stubRequest("GET", "http://gateway.marvel.com/v1/public/path?apiKey=1234&hash=ffd275c5130566a2916217b101f26150&ts=1")
        
        let result = apiClient.sendRequest(.GET, path: anyPath)
        
        expect(result).toEventually(beSuccess())
    }
    
    func testSendsAuthParamsByDefaultPlusTheConfiguredOnes() {
        let apiClient = BaseApiClient(timeProvider: timeProvider, httpClient: httpClient)
        givenCredentialsConfigured(anyPublicKey, privateKey: anyPrivateKey)
        givenCurrentTimeIs(1)
        stubRequest("GET", "http://gateway.marvel.com/v1/public/path?apiKey=1234&hash=ffd275c5130566a2916217b101f26150&k=v&ts=1")
        
        let result = apiClient.sendRequest(.GET, path: anyPath,params: ["k":"v"])
        
        expect(result).toEventually(beSuccess())
    }
    
    private func givenCredentialsConfigured(publicKey: String, privateKey: String) {
        MarvelApiClient.configureCredentials(publicKey, privateKey: privateKey)
    }
    
    private func givenCurrentTimeIs(currentTimeMillis: Int) {
        timeProvider.time = currentTimeMillis
    }
    
    private func beSuccess<T>() -> MatcherFunc<T?> {
        return MatcherFunc { actualExpression, failureMessage in
            failureMessage.postfixMessage = "be success"
            let future = try actualExpression.evaluate() as! Future<HttpResponse,NSError>
            return future.isSuccess
        }
    }

}
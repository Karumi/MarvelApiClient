//
//  MarvelHashGeneratorTests.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import XCTest
import Nimble
@testable import MarvelAPIClient

class MarvelHashGeneratorTests: XCTestCase {

    func testGeneratesTheMd5HashUsingATimestampPlusThePublicKeyPlusThePrivateKey() {
        let timestamp = 1
        let privateKey = "abcd"
        let publicKey = "1234"

        let result = MarvelHashGenerator.generateHash(timestamp: timestamp,
                                                      privateKey: privateKey,
                                                      publicKey: publicKey)

        expect(result).to(equal("ffd275c5130566a2916217b101f26150"))
    }

}

//
//  CharactersApiClientTests.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import XCTest
@testable import MarvelApiClient

class CharactersApiClientTests : XCTestCase {

    func test() {
        let api = CharactersApiClient()
        api.getAll().onSuccess { charaters in
            print(charaters)
            }.onFailure { error in
            print(error)
        }
        sleep(30)
    }
    
}
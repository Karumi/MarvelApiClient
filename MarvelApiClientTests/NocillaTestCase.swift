//
//  NocillaTestCase.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import XCTest
import Nocilla

class NocillaTestCase : XCTestCase {

    let nocilla: LSNocilla = LSNocilla.sharedInstance()
    
    override func setUp() {
        super.setUp()
        nocilla.start()
    }
    
    override func tearDown() {
        nocilla.clearStubs()
        nocilla.stop()
        super.tearDown()
    }
    
}
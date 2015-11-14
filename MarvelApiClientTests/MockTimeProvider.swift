//
//  MockTimeProvider.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
@testable import MarvelApiClient

class MockTimeProvider : TimeProvider {

    var time: Int = 0
    
    override func currentTimeMillis() -> Int {
        return time
    }
    
}
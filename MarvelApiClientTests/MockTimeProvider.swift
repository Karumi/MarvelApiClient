//
//  MockTimeProvider.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
@testable import MarvelAPIClient

class MockTimeProvider: TimeProvider {

    var time: Int

    init(time: Int) {
        self.time = time
    }

    override convenience init() {
        self.init(time: 0)
    }

    override func currentTimeMillis() -> Int {
        return time
    }

}
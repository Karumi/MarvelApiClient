//
//  TimeProvider.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

class TimeProvider {

    func currentTimeMillis() -> Int {
        return Int(NSDate().timeIntervalSince1970 * 1000)
    }
}

//
//  Dictionary.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

func + <K,V> (left: Dictionary<K,V>, right: Dictionary<K,V>) -> Dictionary<K,V> {
    var result = Dictionary<K,V>()
    for (k, v) in left {
        result.updateValue(v, forKey: k)
    }
    for (k, v) in right {
        result.updateValue( v, forKey: k)
    }
    return result
}
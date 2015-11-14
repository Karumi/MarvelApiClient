//
//  MarvelApiClientConfig.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

struct MarvelApiClientConfig {

    static let Host = "http://gateway.marvel.com/v1/public/"
    static let DefaultHeaders = ["Accept" : "application/json"]
    static let TimestampParam = "ts"
    static let ApiKeyParam = "apikey"
    static let HashParam = "hash"
    
}
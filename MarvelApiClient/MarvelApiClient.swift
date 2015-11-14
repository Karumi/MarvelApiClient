//
//  MarvelApiClient.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

class MarvelApiClient {

    static var publicKey: String = ""
    static var privateKey: String = ""
    
    public static func configureCredentials(publicKey: String, privateKey: String) {
        MarvelApiClient.publicKey = publicKey
        MarvelApiClient.privateKey = privateKey
    }
    
}
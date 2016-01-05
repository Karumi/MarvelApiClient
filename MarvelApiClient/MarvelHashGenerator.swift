//
//  MarvelHashGenerator.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import CryptoSwift

class MarvelHashGenerator {

    static func generateHash(timestamp: Int, privateKey: String, publicKey: String) -> String {
        let combinedHash = "\(timestamp)\(privateKey)\(publicKey)"
        return combinedHash.md5()
    }

}
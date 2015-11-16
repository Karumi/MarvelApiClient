//
//  Parser.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente Gomez on 16/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

protocol Parser {
    typealias T

    func fromData(data: NSData) -> T

}
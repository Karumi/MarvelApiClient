//
//  Parser.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 16/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Parser {
    associatedtype T

    func fromJSON(json: JSON) -> T

}
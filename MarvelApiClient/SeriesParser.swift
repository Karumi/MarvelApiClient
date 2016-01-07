//
//  SeriesParser.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 07/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation
import SwiftyJSON

class SeriesParser: Parser {
    typealias T = GetSeriesDTO

    func fromJSON(json: JSON) -> T {
        return GetSeriesDTO(offset: 0,
            limit: 10,
            count: 20,
            series: [SeriesDTO()])
    }
}
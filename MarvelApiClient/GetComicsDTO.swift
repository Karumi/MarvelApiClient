//
//  GetComicsDTO.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente Gomez on 07/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation

public struct GetComicsDTO: Decodable {

    public let offset: Int
    public let limit: Int
    public let count: Int
    public let comics: [ComicDetailDTO]?

}

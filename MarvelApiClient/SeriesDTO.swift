//
//  SeriesDTO.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 07/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation

public struct SeriesDTO {

    public let id: String
    public let title: String?
    public let description: String?
    public let startYear: Int?
    public let endYear: Int?
    public let rating: String?
    public let thumbnail: ThumbnailDTO?
    public let comics: [ComicDTO]?

}
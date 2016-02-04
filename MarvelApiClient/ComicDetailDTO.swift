//
//  ComicsDetailDTO.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente Gomez on 07/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation

public struct ComicDetailDTO {

    public let id: String
    public let title: String?
    public let description: String?
    public let images: [ThumbnailDTO]?

}
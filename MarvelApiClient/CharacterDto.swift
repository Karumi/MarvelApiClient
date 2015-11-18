//
//  File.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

public struct CharacterDto {

    public let id: String
    public let name: String
    public let description: String
    public let thumbnail: ThumbnailDto
    public let comics: [ComicDto]
    public let series: [SerieDto]
    public let stories: [StoryDto]
    public let events: [EventDto]

}
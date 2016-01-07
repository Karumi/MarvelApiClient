//
//  File.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

public struct CharacterDTO {

    public let id: String
    public let name: String?
    public let description: String?
    public let thumbnail: ThumbnailDTO?
    public let comics: [ComicDTO]?
    public let series: [SerieDTO]?
    public let stories: [StoryDTO]?
    public let events: [EventDTO]?

}

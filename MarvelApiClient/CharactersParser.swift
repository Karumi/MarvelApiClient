//
//  CharactersParser.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente Gomez on 16/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import SwiftyJSON

class CharactersParser: Parser {
    typealias T = GetCharactersDto

    func fromData(data: NSData) -> GetCharactersDto {
        let json = JSON(data: data)
        return parseCharactersDto(json["data"])
    }

    func characterDTOFromData(data: NSData) -> CharacterDto {
        let json = JSON(data: data)
        return parseCharacterDto(json["data"]["results"][0])
    }

    private func parseCharactersDto(json: JSON) -> GetCharactersDto {
        return GetCharactersDto(
            offset: json["offset"].intValue,
            limit: json["limit"].intValue,
            count: json["count"].intValue,
            characters: parseCharacters(json["results"]))
    }

    private func parseCharacters(json: JSON) -> [CharacterDto] {
        return json.arrayValue.map { parseCharacterDto($0) }
    }

    private func parseCharacterDto(json: JSON) -> CharacterDto {
        return CharacterDto(
            id: json["id"].stringValue,
            name: json["name"].stringValue,
            description: json["description"].stringValue,
            thumbnail: parseThumbnailDto(json["thumbnail"]),
            comics: parseComics(json["comics"]["items"]),
            series: parseSeries(json["series"]["items"]),
            stories: parseStories(json["stories"]["items"]),
            events: parseEvents(json["events"]["items"])
        )
    }

    private func parseThumbnailDto(json: JSON) -> ThumbnailDto {
        return ThumbnailDto(
            path: json["path"].stringValue,
            format: json["extension"].stringValue)

    }

    private func parseComics(json: JSON) -> [ComicDto] {
        return json.arrayValue.map { ComicDto(name: $0["name"].stringValue) }
    }

    private func parseSeries(json: JSON) -> [SerieDto] {
        return json.arrayValue.map { SerieDto(name: $0["name"].stringValue) }
    }

    private func parseStories(json: JSON) -> [StoryDto] {
        return json.arrayValue.map {
            StoryDto(name: $0["name"].stringValue, type: $0["type"].stringValue)
        }
    }

    private func parseEvents(json: JSON) -> [EventDto] {
        return json.arrayValue.map {
            EventDto(name: $0["name"].stringValue)
        }
    }
}
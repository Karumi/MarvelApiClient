//
//  CharactersParser.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente Gomez on 16/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import SwiftyJSON

class CharactersParser : Parser {
    typealias T = GetCharactersDTO

    func fromData(data: NSData) -> GetCharactersDTO {
        let json = JSON(data: data)
        return parseCharactersDTO(json["data"])
    }

    func parseCharacterDTO(json: JSON) -> CharacterDTO {
        return CharacterDTO(
            id: json["id"].stringValue,
            name: json["name"].stringValue,
            description: json["description"].stringValue,
            thumbnail: parseThumbnailDTO(json["thumbnail"]),
            comics: parseComics(json["comics"]["items"]),
            series: parseSeries(json["series"]["items"]),
            stories: parseStories(json["stories"]["items"]),
            events: parseEvents(json["events"]["items"])
        )
    }

    private func parseCharactersDTO(json: JSON) -> GetCharactersDTO {
        return GetCharactersDTO(
            offset: json["offset"].intValue,
            limit: json["limit"].intValue,
            count: json["count"].intValue,
            characters: parseCharacters(json["results"]))
    }

    private func parseCharacters(json: JSON) -> [CharacterDTO] {
        return json.arrayValue.map { parseCharacterDTO($0) }
    }

    private func parseThumbnailDTO(json: JSON) -> ThumbnailDTO {
        return ThumbnailDTO(
            path: json["path"].stringValue,
            format: json["extension"].stringValue)

    }

    private func parseComics(json: JSON) -> [ComicDTO] {
        return json.arrayValue.map { ComicDTO(name: $0["name"].stringValue) }
    }

    private func parseSeries(json: JSON) -> [SerieDTO] {
        return json.arrayValue.map { SerieDTO(name: $0["name"].stringValue) }
    }

    private func parseStories(json: JSON) -> [StoryDTO] {
        return json.arrayValue.map {
            StoryDTO(name: $0["name"].stringValue, type: $0["type"].stringValue)
        }
    }

    private func parseEvents(json: JSON) -> [EventDTO] {
        return json.arrayValue.map {
            EventDTO(name: $0["name"].stringValue)
        }
    }
}
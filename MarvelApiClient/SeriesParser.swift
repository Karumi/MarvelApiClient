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
        return parseGetSeriesDTO(json: json["data"])
    }

    func seriesDTOFromJSON(json: JSON) -> SeriesDTO {
        return parseSeriesDTO(json: json["data"]["results"][0])
    }

    func getComicsDTOFromJSON(json: JSON) -> GetComicsDTO {
        return GetComicsDTO(
            offset: json["data"]["offset"].intValue,
            limit: json["data"]["limit"].intValue,
            count: json["data"]["count"].intValue,
            comics: parseComicsDetail(json: json["data"]["results"]))
    }

    private func parseGetSeriesDTO(json: JSON) -> GetSeriesDTO {
        return GetSeriesDTO(
            offset: json["offset"].intValue,
            limit: json["limit"].intValue,
            count: json["count"].intValue,
            series: parseSeries(json: json["results"]))
    }

    private func parseSeries(json: JSON) -> [SeriesDTO] {
        return json.arrayValue.map { parseSeriesDTO(json: $0) }
    }

    private func parseSeriesDTO(json: JSON) -> SeriesDTO {
        return SeriesDTO(id: json["id"].stringValue,
            title: json["title"].string,
            description: json["description"].string,
            startYear: json["startYear"].int,
            endYear: json["endYear"].int,
            rating: json["rating"].string,
            thumbnail: parseThumbnailDTO(json: json["thumbnail"]),
            comics: parseComics(json: json["comics"]["items"])
        )
    }

    private func parseThumbnailDTO(json: JSON) -> ThumbnailDTO {
        return ThumbnailDTO(
            path: json["path"].stringValue,
            format: json["extension"].stringValue)

    }

    private func parseComics(json: JSON) -> [ComicDTO] {
        return json.arrayValue.map { ComicDTO(name: $0["name"].string) }
    }

    private func parseComicsDetail(json: JSON) -> [ComicDetailDTO] {
        return json.arrayValue.map { parseComicDetail(json: $0) }
    }

    private func parseComicDetail(json: JSON) -> ComicDetailDTO {
        return ComicDetailDTO(id: json["id"].stringValue,
            title: json["title"].string,
            description: json["description"].string,
            images: parseComicImages(json: json["images"]))
    }

    private func parseComicImages(json: JSON) -> [ThumbnailDTO] {
        return json.arrayValue.map { parseThumbnailDTO(json: $0) }
    }

}

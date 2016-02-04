//
//  GetCharactersDTO.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 16/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

public struct GetCharactersDTO {

    public let offset: Int
    public let limit: Int
    public let count: Int
    public let characters: [CharacterDTO]?

}
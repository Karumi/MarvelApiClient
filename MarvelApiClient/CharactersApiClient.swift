//
//  CharactersApiClient.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import BrightFutures

public class CharactersApiClient : BaseApiClient {
    
    public func getAll() -> Future<[CharacterDTO],NSError> {
        return sendRequest(.GET, path: "characters").map { response -> [CharacterDTO] in
            //TODO: Perform mapping here.
            return [CharacterDTO]()
        }
    }
    
}
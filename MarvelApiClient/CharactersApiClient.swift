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
    
    public func getAll() -> Future<[Character],NSError> {
        return sendRequest(.GET, path: "characters").map { response -> [Character] in
            print(response.statusCode)
            print(response.body)
            return [Character]()
        }
    }
    
}
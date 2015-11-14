//
//  CharactersApiClient.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import BrightFutures

public class CharactersApiClient {

    //TODO: Abstract this.
    private let httpClient = AlamofireHttpClient()
    
    public func getAll() -> Future<[Character],NSError> {
        let request = HttpRequest(url: "http://gateway.marvel.com:80/v1/public/characters?apikey=54355f684e1983a183d7bfec96a4bf81", parameters: [String:String](), headers: [String:String](), verb: .GET)
        return httpClient.send(request).map { response -> [Character] in
            print(response.statusCode)
            print(response.body)
            return [Character]()
        }
        
    }
    
}
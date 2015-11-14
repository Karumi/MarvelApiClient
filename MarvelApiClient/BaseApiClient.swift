//
//  BaseApiClient.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import BrightFutures

class BaseApiClient {
    
    private let host = "http://gateway.marvel.com/v1/public/"
    private let defaultHeaders = ["Accept" : "application/json"]
    
    private let httpClient = AlamofireHttpClient()
    
    func sendRequest(verb: HttpVerb, path: String, params: [String:String]? = [String:String]()) -> Future<HttpResponse,NSError>{
        let parameters = addDefaultParams(params)
        let request = HttpRequest(
            url: host + path,
            parameters: parameters,
            headers: defaultHeaders,
            verb: verb)
        return httpClient.send(request)
    }
    
    private func addDefaultParams(params: [String:String]?) -> [String:String] {
        let timestamp = NSDate().timeIntervalSince1970 * 1000
        let privateKey = MarvelApiClient.privateKey
        let publicKey = MarvelApiClient.publicKey
        let hash = MarvelHashGenerator.generateHash(Int(timestamp), privateKey: privateKey, publicKey: publicKey)
        let authParams = [ "ts" : "\(timestamp)", "apiKey" : publicKey, "hash" : hash]
        return authParams + (params ?? [String:String]())
    }
}
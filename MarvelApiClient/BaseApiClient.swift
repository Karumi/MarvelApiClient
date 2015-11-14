//
//  BaseApiClient.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import BrightFutures

public class BaseApiClient {
    
    let httpClient: HttpClient
    let timeProvider: TimeProvider
    
    init(timeProvider: TimeProvider, httpClient: HttpClient) {
        self.timeProvider = timeProvider
        self.httpClient = httpClient
    }
    
    func sendRequest(verb: HttpVerb, path: String, params: [String:String]? = [String:String]()) -> Future<HttpResponse,NSError>{
        let parameters = addDefaultParams(params)
        let request = HttpRequest(
            url: MarvelApiClientConfig.Host + path,
            parameters: parameters,
            headers: MarvelApiClientConfig.DefaultHeaders,
            verb: verb)
        return httpClient.send(request)
    }
    
    private func addDefaultParams(params: [String:String]?) -> [String:String] {
        let timestamp = timeProvider.currentTimeMillis()
        let privateKey = MarvelApiClient.privateKey
        let publicKey = MarvelApiClient.publicKey
        let hash = MarvelHashGenerator.generateHash(Int(timestamp), privateKey: privateKey, publicKey: publicKey)
        let authParams = [ MarvelApiClientConfig.TimestampParam : "\(timestamp)",
            MarvelApiClientConfig.ApiKeyParam : publicKey,
            MarvelApiClientConfig.HashParam : hash]
        return authParams + (params ?? [String:String]())
    }
}
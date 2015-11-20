//
//  AlamofireHttpClient.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente Gomez on 12/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import Alamofire_Result
import BrightFutures

class AlamofireHTTPClient: HTTPClient {

    func send(httpRequest: HTTPRequest) -> Future<HTTPResponse, NSError> {
        let manager = Manager.sharedInstance
        let promise = Promise<HTTPResponse, NSError>()
        let httpMethod = Alamofire_Result.Method(rawValue: httpRequest.httpMethod.rawValue) ?? .GET
        manager.request(httpMethod, httpRequest.url, parameters: httpRequest.parameters).responseData { response in
            if let error = response.result.error {
                promise.failure(error)
            } else if let httpResponse = response.response {
                let statusCode = httpResponse.statusCode
                let body = response.result.value
                let response = HTTPResponse(statusCode: statusCode, body: body ?? NSData())
                return promise.success(response)
            }
        }
        return promise.future
    }
}

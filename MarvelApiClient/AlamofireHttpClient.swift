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

class AlamofireHttpClient: HttpClient {

    func send(httpRequest: HttpRequest) -> Future<HttpResponse, NSError> {
        let manager = Manager.sharedInstance
        let promise = Promise<HttpResponse, NSError>()
        let verb = Method(rawValue: httpRequest.verb.toAlamofireVerb())!

        manager.request(verb, httpRequest.url, parameters: httpRequest.parameters).responseString { response in
            if let error = response.result.error {
                promise.failure(error)
            }else if let httpResponse = response.response {
                let statusCode = httpResponse.statusCode
                let body = response.result.value
                let response = HttpResponse(statusCode: statusCode, body: body)
                return promise.success(response)
            }
        }
        return promise.future
    }
}

private extension HttpVerb {

    private func toAlamofireVerb() -> String {
        switch self {
            case HttpVerb.GET:
                return Method.GET.rawValue
            case HttpVerb.POST:
                return Method.POST.rawValue
            case HttpVerb.PUT:
                return Method.PUT.rawValue
            case HttpVerb.DELETE:
                return Method.DELETE.rawValue
        }
    }

}
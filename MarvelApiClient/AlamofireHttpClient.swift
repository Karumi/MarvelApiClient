//
//  AlamofireHttpClient.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente Gomez on 12/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import Result
import Alamofire_Result

class AlamofireHttpClient: HttpClient {

    func send(httpRequest: HttpRequest) -> Result<HttpResponse, NSError> {
        return Result.Success(HttpResponse(statusCode: 200, body: ""))
    }
}

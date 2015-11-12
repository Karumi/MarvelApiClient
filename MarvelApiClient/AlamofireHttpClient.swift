//
//  AlamofireHttpClient.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente Gomez on 12/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import Alamofire_Result
import SwiftyJSON
import BrightFutures

class AlamofireHttpClient: HttpClient {

    func send(httpRequest: HttpRequest) -> Future<HttpResponse, NSError> {
        let manager = Manager.sharedInstance
        let promise = Promise<HttpResponse, NSError>()
        manager.request(.GET, "https://httpbin.org/get").responseJSON { response in

        }
        return promise.future
    }
}

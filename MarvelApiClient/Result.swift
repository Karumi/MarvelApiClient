//
//  Result.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 05/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation
import BothamNetworking
import Result
import SwiftyJSON

extension ResultType where Value == HTTPResponse {

    func mapJSON<U>(@noescape transform: JSON -> U) -> Result<U, Error> {
        return flatMap { result in
            let data = self.value?.body
            return dataToJSONResult(data).map { transform($0) }
        }
    }

    private func dataToJSONResult(data: NSData?) -> Result<JSON, Error> {
        return Result<JSON, Error> {
            let object: AnyObject = try NSJSONSerialization.JSONObjectWithData(data ?? NSData(),
                options: .AllowFragments)
            return JSON(object)
        }
    }

}
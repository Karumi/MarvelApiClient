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

extension ResultType where Value == HTTPResponse, Error == BothamAPIClientError {

    func mapJSON<U>(transform: JSON -> U) -> Result<U, BothamAPIClientError> {
        return flatMap { result in
                let data = self.value?.body
                return dataToJSONResult(data).map { transform($0) }
            }
    }

    private func dataToJSONResult(data: NSData?) -> Result<JSON, BothamAPIClientError> {
        do {
            let object: AnyObject = try NSJSONSerialization.JSONObjectWithData(data ?? NSData(),
                options: .AllowFragments)
            return Result.Success(JSON(object))
        } catch {
            let parsingError = error as NSError
            return Result.Failure(BothamAPIClientError.ParsingError(error: parsingError))
        }
    }

}
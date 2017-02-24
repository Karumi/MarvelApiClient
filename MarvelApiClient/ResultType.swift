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

extension ResultProtocol where Value == HTTPResponse, Error == BothamAPIClientError {

    private func dataToJSONResult(data: Data?) -> Result<JSON, BothamAPIClientError> {
        do {
            let object: Any = try JSONSerialization.jsonObject(with: data ?? Data(),
                options: .allowFragments)
            return Result.success(JSON(object))
        } catch {
            let parsingError = error as NSError
            return Result.failure(BothamAPIClientError.parsingError(error: parsingError))
        }
    }

}

//
//  FutureMatchers.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import Nimble
import Result
import BothamNetworking
@testable import MarvelApiClient

func beSuccess<T>() -> MatcherFunc<T?> {
    return MatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "be success"
        let result = try actualExpression.evaluate() as? Result<HTTPResponse, NSError>
        return result?.value != nil
    }
}

func failWithError<T>(expectedError: NSError) -> MatcherFunc<T?> {
    return MatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "has error"
        let result = try actualExpression.evaluate() as? Result<HTTPResponse, NSError>
        if let error = result?.error {
            return expectedError == error
        } else {
            return false
        }
    }
}

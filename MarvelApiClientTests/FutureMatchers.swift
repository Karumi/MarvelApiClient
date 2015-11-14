//
//  FutureMatchers.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import Nimble
import BrightFutures
@testable import MarvelApiClient

func beSuccess<T>() -> MatcherFunc<T?> {
    return MatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "be success"
        let future = try actualExpression.evaluate() as! Future<HttpResponse,NSError>
        return future.isSuccess
    }
}

func failWithError<T>(expectedError: NSError) -> MatcherFunc<T?> {
    return MatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "has error"
        let future = try actualExpression.evaluate() as! Future<HttpResponse,NSError>
        if let error = future.error {
            return expectedError == error
        } else {
            return false
        }
    }
}

//
//  ResultType.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente Gomez on 05/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation
import XCTest
import Nimble
import Result
import SwiftyJSON
import BothamNetworking
@testable import MarvelAPIClient

class ResultTypeTests: XCTestCase {

    func testReturnsMalformedJsonAsAParsingError() {
        let malformedJSON = "{".dataUsingEncoding(NSUTF8StringEncoding)
        let response = HTTPResponse(statusCode: 200, headers: nil, body: malformedJSON!)
        let result = Result<HTTPResponse, BothamAPIClientError>.Success(response)

        let jsonMappingError = result.mapJSON { return $0 }

        expect(jsonMappingError.error).to(equal(BothamAPIClientError.ParsingError(error: NSError.anyError())))
    }

}

extension BothamAPIClientError: Equatable {}

public func == (lhs: BothamAPIClientError, rhs: BothamAPIClientError) -> Bool {
    switch (lhs, rhs) {
    case (.ParsingError, .ParsingError):
        return true
    default:
        return false
    }
}

extension NSError {

    static func anyError() -> NSError {
        return NSError(domain: "Any error", code: 0, userInfo: nil)
    }

}
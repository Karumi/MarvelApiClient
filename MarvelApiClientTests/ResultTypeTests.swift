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
import BothamNetworking
@testable import MarvelAPIClient

private struct Empty: Decodable{}

class ResultTypeTests: XCTestCase {

    func testReturnsMalformedJsonAsAParsingError() {
        let malformedJSON = "{".data(using: String.Encoding.utf8)
        let response = HTTPResponse(statusCode: 200, headers: nil, body: malformedJSON!)
        let result = Result<HTTPResponse, BothamAPIClientError>.success(response)

        let jsonMappingError: Result<Empty, BothamAPIClientError> = result.mapJSON()

        expect(jsonMappingError.error).to(equal(BothamAPIClientError.parsingError(error: NSError.anyError())))
    }

}

extension BothamAPIClientError: Equatable {}

public func == (lhs: BothamAPIClientError, rhs: BothamAPIClientError) -> Bool {
    switch (lhs, rhs) {
    case (.parsingError, .parsingError):
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

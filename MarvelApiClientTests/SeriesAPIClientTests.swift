//
//  SeriesAPIClientTests.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 07/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation
import XCTest
import Nocilla
import Nimble
import BothamNetworking
import Result
@testable import MarvelAPIClient

class SeriesAPIClientTests: MarvelAPIClientTests {

    func testReturnsGetSeriesResponse() {
        let seriesAPIClient = givenASeriesAPIClient()
        stubRequest("GET",
            "http://gateway.marvel.com/v1/public/series?"
                + "limit=1&apikey=1234&offset=0&hash=ffd275c5130566a2916217b101f26150&ts=1")
            .andReturn(200)
            .withBody(fromJsonFile("getAllSeries"))

        var response: Result<GetSeriesDTO, BothamAPIClientError>?
        seriesAPIClient.getAll(offset: 0, limit: 1) { result in
            response = result
        }

        expect(response).toEventuallyNot(beNil())
        assertContainsExpectedGetSeriesDTO(response?.value)
    }

    private func assertContainsExpectedGetSeriesDTO(seriesDTO: GetSeriesDTO?) {
        expect(seriesDTO).toNot(beNil())
        expect(seriesDTO?.count).to(equal(1))
        expect(seriesDTO?.offset).to(equal(0))
        expect(seriesDTO?.limit).to(equal(1))
        expect(seriesDTO?.series[0].id).to(equal("18454"))
        expect(seriesDTO?.series[0].title).to(equal("100th Anniversary Special (2014 - Present)"))
        expect(seriesDTO?.series[0].description).to(equal("100th Anniversary"))
        expect(seriesDTO?.series[0].startYear).to(equal(2014))
        expect(seriesDTO?.series[0].endYear).to(equal(2099))
        expect(seriesDTO?.series[0].rating).to(equal("Rated T"))
        expect(seriesDTO?.series[0].thumbnail.path).to(equal("http://i.annihil.us/u/prod/marvel/i/mg/b/40/23124af34as"))
        expect(seriesDTO?.series[0].thumbnail.format).to(equal("jpg"))
        expect(seriesDTO?.series[0].comics?.count).to(equal(1))
        expect(seriesDTO?.series[0].comics?[0].name).to(equal("100th Anniversary Special (2014) #1"))

    }

    private func givenASeriesAPIClient() -> SeriesAPIClient {
        let bothamAPIClient = givenABothamAPIClient()
        return SeriesAPIClient(apiClient: bothamAPIClient, parser: SeriesParser())
    }

}

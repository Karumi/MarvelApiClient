//
//  CharactersApiClientTests.swift
//  MarvelApiClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import XCTest
import Nocilla
import Nimble
import BrightFutures
@testable import MarvelApiClient

class CharactersApiClientTests : MarvelApiClientTests {

    private let marvelBaseEndpoint = "http://gateway.marvel.com/v1/public/"

    func testReturnsGetCharactersResponse() {
        let charactersApiClient = givenACharactersApiClient()
        stubRequest("GET", "http://gateway.marvel.com/v1/public/characters?apikey=1234&hash=ffd275c5130566a2916217b101f26150&limit=1&offset=0&ts=1")
        .andReturn(200)
        .withBody(fromJsonFile("getAllCharacters"))

        let result = charactersApiClient.getAll(0, limit: 1)

        expect(result).toEventually(beGetCharactersDTOSuccess())
        assertContainsExpectedGetCharactersDTO(result.value!)
    }

    func testReturnsGetCharacterById() {
        let charactersApiClient = givenACharactersApiClient()
        stubRequest("GET", "http://gateway.marvel.com/v1/public/characters/1?apikey=1234&hash=ffd275c5130566a2916217b101f26150&ts=1")
            .andReturn(200)
            .withBody(fromJsonFile("getCharacterById"))

        let result = charactersApiClient.getById("1")

        expect(result).toEventually(beGetCharacterByIdSuccess())
        assertContainsExpectedCharacterDTO(result.value!)
    }

    private func givenACharactersApiClient() -> CharactersApiClient {
        let baseApiClient = MarvelBaseApiClient(baseEndpoint: marvelBaseEndpoint, timeProvider: timeProvider, httpClient: httpClient)
        return CharactersApiClient(apiClient: baseApiClient, parser: CharactersParser())
    }

    private func assertContainsExpectedGetCharactersDTO(getCharactersDTO: GetCharactersDto) {
        expect(getCharactersDTO.count).to(equal(1))
        expect(getCharactersDTO.offset).to(equal(0))
        expect(getCharactersDTO.limit).to(equal(1))
        expect(getCharactersDTO.characters[0].id).to(equal("1011334"))
        expect(getCharactersDTO.characters[0].name).to(equal("3-D Man"))
        expect(getCharactersDTO.characters[0].description).to(equal("Tridimensional Hero"))
        expect(getCharactersDTO.characters[0].thumbnail.path).to(equal("http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"))
        expect(getCharactersDTO.characters[0].thumbnail.format).to(equal("jpg"))
        expect(getCharactersDTO.characters[0].thumbnail.fullPath).to(equal("http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg"))
        expect(getCharactersDTO.characters[0].comics.count).to(equal(11))
        expect(getCharactersDTO.characters[0].comics[0].name).to(equal("Avengers: The Initiative (2007) #14"))
        expect(getCharactersDTO.characters[0].series.count).to(equal(2))
        expect(getCharactersDTO.characters[0].series[0].name).to(equal("Avengers: The Initiative (2007 - 2010)"))
        expect(getCharactersDTO.characters[0].stories.count).to(equal(17))
        expect(getCharactersDTO.characters[0].stories[0].name).to(equal("Cover #19947"))
        expect(getCharactersDTO.characters[0].stories[0].type).to(equal("cover"))
        expect(getCharactersDTO.characters[0].events.count).to(equal(1))
        expect(getCharactersDTO.characters[0].events[0].name).to(equal("Secret Invasion"))
    }

    private func beGetCharactersDTOSuccess<T>() -> MatcherFunc<T?> {
        return MatcherFunc { actualExpression, failureMessage in
            failureMessage.postfixMessage = "be success"
            let future = try actualExpression.evaluate() as! Future<GetCharactersDto,NSError>
            return future.isSuccess
        }
    }

    private func beGetCharacterByIdSuccess<T>() -> MatcherFunc<T?> {
        return MatcherFunc { actualExpression, failureMessage in
            failureMessage.postfixMessage = "be success"
            let future = try actualExpression.evaluate() as! Future<CharacterDto,NSError>
            return future.isSuccess
        }
    }

    private func assertContainsExpectedCharacterDTO(characterDTO: CharacterDto) {
        expect(characterDTO.id).to(equal("1011334"))
        expect(characterDTO.name).to(equal("3-D Man"))
        expect(characterDTO.description).to(equal("Tridimensional Hero"))
        expect(characterDTO.thumbnail.path).to(equal("http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"))
        expect(characterDTO.thumbnail.format).to(equal("jpg"))
        expect(characterDTO.thumbnail.fullPath).to(equal("http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg"))
        expect(characterDTO.comics.count).to(equal(11))
        expect(characterDTO.comics[0].name).to(equal("Avengers: The Initiative (2007) #14"))
        expect(characterDTO.series.count).to(equal(2))
        expect(characterDTO.series[0].name).to(equal("Avengers: The Initiative (2007 - 2010)"))
        expect(characterDTO.stories.count).to(equal(17))
        expect(characterDTO.stories[0].name).to(equal("Cover #19947"))
        expect(characterDTO.stories[0].type).to(equal("cover"))
        expect(characterDTO.events.count).to(equal(1))
        expect(characterDTO.events[0].name).to(equal("Secret Invasion"))
    }

}
//
//  CharactersAAPIClientTests.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente on 14/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import XCTest
import Nocilla
import Nimble
import BothamNetworking
import Result
@testable import MarvelAPIClient

class CharactersAPIClientTests: MarvelAPIClientTests {

    func testReturnsGetCharactersResponse() {
        let charactersApiClient = givenACharactersAPIClient()
        stubRequest("GET",
            "http://gateway.marvel.com/v1/public/characters?"
                + "limit=1&apikey=1234&offset=0&hash=ffd275c5130566a2916217b101f26150&ts=1")
        .andReturn(200)
        .withBody(fromJsonFile("getAllCharacters"))

        var response: Result<GetCharactersDTO, BothamAPIClientError>?
        charactersApiClient.getAll(offset: 0, limit: 1) { result in
            response = result
        }

        expect(response).toEventuallyNot(beNil())
        assertContainsExpectedGetCharactersDTO(response?.value)
    }

    func testReturnsGetCharacterById() {
        let charactersApiClient = givenACharactersAPIClient()
        stubRequest("GET",
            "http://gateway.marvel.com/v1/public/characters/1?"
             + "apikey=1234&ts=1&hash=ffd275c5130566a2916217b101f26150")
            .andReturn(200)
            .withBody(fromJsonFile("getCharacterById"))

        var response: Result<CharacterDTO, BothamAPIClientError>?
        charactersApiClient.getById("1") { result in
            response = result
        }

        expect(response).toEventuallyNot(beNil())
        assertContainsExpectedCharacterDTO(response?.value)
    }

    private func givenACharactersAPIClient() -> CharactersAPIClient {
        let apiClient = givenABothamAPIClient()
        return CharactersAPIClient(apiClient: apiClient, parser: CharactersParser())
    }

    private func assertContainsExpectedGetCharactersDTO(getCharactersDTO: GetCharactersDTO?) {
        expect(getCharactersDTO).toNot(beNil())
        expect(getCharactersDTO?.count).to(equal(1))
        expect(getCharactersDTO?.offset).to(equal(0))
        expect(getCharactersDTO?.limit).to(equal(1))
        expect(getCharactersDTO?.characters[0].id).to(equal("1011334"))
        expect(getCharactersDTO?.characters[0].name).to(equal("3-D Man"))
        expect(getCharactersDTO?.characters[0].description).to(equal("Tridimensional Hero"))
        expect(getCharactersDTO?.characters[0].thumbnail.path)
            .to(equal("http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"))
        expect(getCharactersDTO?.characters[0].thumbnail.format).to(equal("jpg"))
        expect(getCharactersDTO?.characters[0].comics.count).to(equal(11))
        expect(getCharactersDTO?.characters[0].comics[0].name).to(equal("Avengers: The Initiative (2007) #14"))
        expect(getCharactersDTO?.characters[0].series.count).to(equal(2))
        expect(getCharactersDTO?.characters[0].series[0].name).to(equal("Avengers: The Initiative (2007 - 2010)"))
        expect(getCharactersDTO?.characters[0].stories.count).to(equal(17))
        expect(getCharactersDTO?.characters[0].stories[0].name).to(equal("Cover #19947"))
        expect(getCharactersDTO?.characters[0].stories[0].type).to(equal("cover"))
        expect(getCharactersDTO?.characters[0].events.count).to(equal(1))
        expect(getCharactersDTO?.characters[0].events[0].name).to(equal("Secret Invasion"))
    }

    private func assertContainsExpectedCharacterDTO(characterDTO: CharacterDTO?) {
        expect(characterDTO?.id).to(equal("1011334"))
        expect(characterDTO?.name).to(equal("3-D Man"))
        expect(characterDTO?.description).to(equal("Tridimensional Hero"))
        expect(characterDTO?.thumbnail.path).to(equal("http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"))
        expect(characterDTO?.thumbnail.format).to(equal("jpg"))
        expect(characterDTO?.comics.count).to(equal(11))
        expect(characterDTO?.comics[0].name).to(equal("Avengers: The Initiative (2007) #14"))
        expect(characterDTO?.series.count).to(equal(2))
        expect(characterDTO?.series[0].name).to(equal("Avengers: The Initiative (2007 - 2010)"))
        expect(characterDTO?.stories.count).to(equal(17))
        expect(characterDTO?.stories[0].name).to(equal("Cover #19947"))
        expect(characterDTO?.stories[0].type).to(equal("cover"))
        expect(characterDTO?.events.count).to(equal(1))
        expect(characterDTO?.events[0].name).to(equal("Secret Invasion"))
    }

}
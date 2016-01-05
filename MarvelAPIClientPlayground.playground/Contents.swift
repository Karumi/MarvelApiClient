//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import MarvelAPIClient

MarvelAPIClient.configureCredentials(
    publicKey: "54355f684e1983a183d7bfec96a4bf81",
    privateKey: "4ad71e7b61e40311545909af0d6ebbd52bbfeae3")

let charactersAPIClient = MarvelAPIClient.charactersAPIClient
print("Get Chars By offset and limit: ")
charactersAPIClient.getAll(offset: 0, limit: 10) { response in
    print("Characters obtained from the Marvel API")
    let characters = response.value?.characters
    characters?.forEach { character in
        print(character.name)
    }

}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

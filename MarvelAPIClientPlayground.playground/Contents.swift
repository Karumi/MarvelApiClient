//: MarvelAPIClientPlayground

import UIKit
import XCPlayground
import MarvelAPIClient

MarvelAPIClient.configureCredentials(
    publicKey: "PUT_YOUR_PUBLIC_KEY_HERE",
    privateKey: "PUT_YOUR_PRIVATE_KEY_HERE")

let charactersAPIClient = MarvelAPIClient.charactersAPIClient

charactersAPIClient.getAll(offset: 0, limit: 10) { response in
    print("Get characters by offset and limit:")
    let characters = response.value?.characters
    print(characters?[0].name)

}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

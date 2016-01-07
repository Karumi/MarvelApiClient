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

let seriesAPIClient = MarvelAPIClient.seriesAPIClient

seriesAPIClient.getAll(offset: 0, limit: 10) { response in
    print("Get series by offset and limit:")
    let series = response.value?.series
    print(series?[0].title)
}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

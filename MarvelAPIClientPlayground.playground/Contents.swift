//: MarvelAPIClientPlayground

import UIKit
import XCPlayground
import MarvelAPIClient

MarvelAPIClient.configureCredentials(
    publicKey: "54355f684e1983a183d7bfec96a4bf81",
    privateKey: "4ad71e7b61e40311545909af0d6ebbd52bbfeae3")

let charactersAPIClient = MarvelAPIClient.charactersAPIClient

charactersAPIClient.getAll(offset: 0, limit: 10) { response in
    print("Get characters by offset and limit:")
    let characters = response.value?.characters
    print(characters?[0].name)
}

let seriesAPIClient = MarvelAPIClient.seriesAPIClient

seriesAPIClient.getAll(offset: 0, limit: 1) { response in
    print("Get series by offset and limit:")
    let series = response.value?.series
    print(series?[0].title)
}

seriesAPIClient.getComics(seriesId: "18454", offset: 0, limit: 1) { response in
    print("Get comics by series id:")
    let comics = response.value?.comics
    print(comics?[0].title)
}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

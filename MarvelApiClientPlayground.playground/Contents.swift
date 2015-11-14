//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import MarvelApiClient

var str = "Hello, playground"


MarvelApiClient.configureCredentials(
    "54355f684e1983a183d7bfec96a4bf81",
    privateKey: "4ad71e7b61e40311545909af0d6ebbd52bbfeae3")

let charactersApiClient = MarvelApiClient.charactersApiClient
charactersApiClient.getAll().map { print($0) }

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

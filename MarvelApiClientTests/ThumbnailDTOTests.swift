//
//  ThumbnailDTO.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 07/01/16.
//  Copyright © 2016 GoKarumi S.L. All rights reserved.
//

import Foundation
import XCTest
import Nimble
@testable import MarvelAPIClient

class ThumbnailDTOTests: XCTestCase {

    private let anyPath = "http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73"
    private let anyFormat = "jpg"

    func testGeneratesFullSizeThumbnailURLProperly() {
        let thumbnail = givenAThumbnailDTO(anyPath, anyFormat)

        let thumbnailURL = thumbnail.URL(variant: .fullSize)

        expect(thumbnailURL).to(equal(NSURL(string: anyPath + "." + anyFormat)))
    }

    func testGeneratesThumbnailURLBasedOnVariant() {
        let thumbnail = givenAThumbnailDTO(anyPath, anyFormat)
        let variants: [ThumbnailDTOVariant] = [.portraitSmall,
            .portraitMedium,
            .portraitExtraLarge,
            .portraitFantastic,
            .portraitUncanny,
            .portratiIncredible,
            .standardSmall,
            .standardMedium,
            .standardLarge,
            .standardExtraLarge,
            .standardFantastic,
            .standardAmazing,
            .landspaceSmall,
            .landscapeMedium,
            .landscapeLarge,
            .landscapeExtraLarge,
            .landscapeAmazing,
            .landscapeIncredible,
            .detail]

        variants.forEach { variant in
            let thumbnailURL = thumbnail.URL(variant: variant)

            expect(thumbnailURL).to(equal(NSURL(string: anyPath + "/" + variant.rawValue + "." + anyFormat)))
        }
    }

    private func givenAThumbnailDTO(_ path: String, _ format: String) -> ThumbnailDTO {
        return ThumbnailDTO(path: path, format: format)
    }

}


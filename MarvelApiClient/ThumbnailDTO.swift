//
//  ThumbnailDTO.swift
//  MarvelAPIClient
//
//  Created by Pedro Vicente Gomez on 16/11/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation

public struct ThumbnailDTO {

    public let path: String
    public let format: String

    public func URL(variant: ThumbnailDTOVariant) -> NSURL? {
        switch variant {
        case .fullSize:
            return NSURL(string: "\(path).\(format)")
        default:
            return NSURL(string: "\(path)/\(variant.rawValue).\(format)")
        }

    }
}

public enum ThumbnailDTOVariant: String {

    case portraitSmall = "portrait_small"
    case portraitMedium = "portrait_medium"
    case portraitExtraLarge = "portrait_xlarge"
    case portraitFantastic = "portrait_fantastic"
    case portraitUncanny = "portrait_uncanny"
    case portratiIncredible = "portrait_incredible"

    case standardSmall = "standard_small"
    case standardMedium = "standard_medium"
    case standardLarge = "standard_large"
    case standardExtraLarge = "standard_xlarge"
    case standardFantastic = "standard_fantastic"
    case standardAmazing = "standard_amazing"

    case landspaceSmall = "landscape_small"
    case landscapeMedium = "landscape_medium"
    case landscapeLarge = "landscape_large"
    case landscapeExtraLarge = "landscape_xlarge"
    case landscapeAmazing = "landscape_amazing"
    case landscapeIncredible = "landscape_incredible"

    case detail = "detail"

    case fullSize
}

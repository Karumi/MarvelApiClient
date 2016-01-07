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
        case .FullSize:
            return NSURL(string: "\(path).\(format)")
        default:
            return NSURL(string: "\(path)/\(variant.rawValue).\(format)")
        }

    }
}

public enum ThumbnailDTOVariant: String {

    case PortraitSmall = "portrait_small"
    case PortraitMedium = "portrait_medium"
    case PortraitExtraLarge = "portrait_xlarge"
    case PortraitFantastic = "portrait_fantastic"
    case PortraitUncanny = "portrait_uncanny"
    case PortratiIncredible = "portrait_incredible"

    case StandardSmall = "standard_small"
    case StandardMedium = "standard_medium"
    case StandardLarge = "standard_large"
    case StandardExtraLarge = "standard_xlarge"
    case StandardFantastic = "standard_fantastic"
    case StandardAmazing = "standard_amazing"

    case LandspaceSmall = "landscape_small"
    case LandscapeMedium = "landscape_medium"
    case LandscapeLarge = "landscape_large"
    case LandscapeExtraLarge = "landscape_xlarge"
    case LandscapeAmazing = "landscape_amazing"
    case LandscapeIncredible = "landscape_incredible"

    case Detail = "detail"

    case FullSize
}
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
    public var fullPath: String {
        return "\(path).\(format)"
    }
}
//
//  ModelData.swift
//  Data
//
//  Created by Dwi Ariyanto on 04/02/20.
//  Copyright © 2020 Kristal. All rights reserved.
//

import Foundation

public struct DataModel: Codable {
    public let data: [ProductModel]
}

public struct ProductModel: Codable {
    public let type: String
    public let attributes: AttributesModel
}

public struct AttributesModel: Codable {
    public let id: String?
    public let name: String?
    public let review: String?
    public let sold: Int?
    public let watcher: Int?
    public let discussions: String?
    public let video: [String]?
    public let mustBeInsured: String?
    public let descriptionUrl: String?
    public let isCrossBorder: String?
}

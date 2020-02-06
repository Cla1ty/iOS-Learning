//
//  ParamModel.swift
//  Data
//
//  Created by Dwi Ariyanto on 04/02/20.
//  Copyright © 2020 Kristal. All rights reserved.
//

import Foundation

public struct ParamModel: Codable {
    public init(show: Int) {
        self.show = show
    }
    
    public let show: Int
}

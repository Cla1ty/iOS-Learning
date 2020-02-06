//
//  ProductService.swift
//  ExampleAlamofire
//
//  Created by Dwi Ariyanto on 04/02/20.
//  Copyright © 2020 Kristal. All rights reserved.
//

import RxSwift
import Data

class ProductService {
    func getCheapest(show: Int) -> Single<DataModel> {
        return RestClient.shared.get("https://api1.jakmall.pw/products/cheapest", query: ["category": "", "show": show])
    }
}

//
//  CitiesService.swift
//  ExampleAlamofire
//
//  Created by Dwi Ariyanto on 04/02/20.
//  Copyright © 2020 Kristal. All rights reserved.
//

import RxSwift

class CitiesService {
    
    func getCities() -> Single<Response<CityResponse>> {
        let query =
            """
            query Cities {
                cities(provinceId: 1) {
                    id
                    name
                }
            }
            """
        
        let param = Param(query: query)
        
        return RestClient.shared.post(graphql, body: param)
    }
}

struct Param: Codable {
    let query: String
}

struct Response<DATA: Codable>: Codable {
    let data: DATA
}

struct CityResponse: Codable {
    let cities: [CityModel]
}

struct CityModel: Codable {
    let id: String
    let name: String
}



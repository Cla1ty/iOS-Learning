//
//  RestClient.swift
//  ExampleAlamofire
//
//  Created by Dwi Ariyanto on 04/02/20.
//  Copyright © 2020 Kristal. All rights reserved.
//

import Alamofire
import RxSwift
import Data


class RestClient {
    private let encoder = URLEncodedFormParameterEncoder(encoder: URLEncodedFormEncoder.init(keyEncoding: .convertToSnakeCase), destination: .httpBody)
    private let decoder = JSONDecoder()
    
    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func get<RESULT: Decodable>(_ url: String, query: [String: Any]) -> Single<RESULT> {
        return Single.create { emitter in
            let request = AF.request(url, method: .get, parameters: query)
                .validate()
                .responseDecodable(of: RESULT.self, decoder: self.decoder) { response in
                    if let value = response.value {
                        emitter(.success(value))
                    } else if let error = response.error {
                        emitter(.error(error))
                    }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func post<RESULT: Decodable, PARAM: Encodable>(_ url: String, body: PARAM) -> Single<RESULT> {
        return Single.create { emitter in
            let request = AF.request(url, method: .post, parameters: body, encoder: self.encoder)
                .validate()
                .responseDecodable(of: RESULT.self, decoder: self.decoder) { response in
                    if let value = response.value {
                        emitter(.success(value))
                    } else if let error = response.error {
                        emitter(.error(error))
                    }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    static let shared = RestClient()
}


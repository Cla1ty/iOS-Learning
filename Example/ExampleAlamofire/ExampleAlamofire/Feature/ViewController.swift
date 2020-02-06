//
//  ViewController.swift
//  ExampleAlamofire
//
//  Created by Dwi Ariyanto on 21/01/20.
//  Copyright © 2020 Kristal. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift
import Common
import Data

class ViewController: UIViewController {
    
    private var disposable: Disposable?
    private let disposeBag = DisposeBag()
    
    private let service = ProductService()
    private let cityService = CitiesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getCheapest(show: 2).subscribe(onSuccess: { data in
            print("Data = \(data)")
        }, onError: { error in
            print("Error = \(error)")
        }).disposed(by: disposeBag)
        
        cityService.getCities().subscribe(onSuccess: { data in
            print("Data2 = \(data)")
        }, onError: { error in
            print("Error2 = \(error)")
        }).disposed(by: disposeBag)
    }
    
    
}



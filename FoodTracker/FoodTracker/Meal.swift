//
//  Meal.swift
//  FoodTracker
//
//  Created by Dwi Ariyanto on 13/09/19.
//  Copyright © 2019 Kristal. All rights reserved.
//

import UIKit

class Meal {
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    
    //Mark: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        //Initialize store properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    
}

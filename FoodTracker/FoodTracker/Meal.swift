//
//  Meal.swift
//  FoodTracker
//
//  Created by Dwi Ariyanto on 13/09/19.
//  Copyright © 2019 Kristal. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Archiving Paths
    static let DocumentsDictionary = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first
    static let ArchiveURL = DocumentsDictionary?.appendingPathComponent("meals")
    
    //MARK: Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    
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
    
    // MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object", log: OSLog.default, type: .debug)
            return nil
        }
        
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
    
        self.init(name: name, photo: photo, rating: rating)
    }
}

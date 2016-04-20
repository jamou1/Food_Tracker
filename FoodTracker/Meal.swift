//
//  Meal.swift
//  FoodTracker
//
//  Created by James Moulton on 4/20/16.
//  Copyright © 2016 lavaflowmobile. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    //MARK: Properties
    var name: String
    var photo: UIImage
    var rating: Int
    
    //MARK: Archiving Paths
    static let DocumentsDirectory =
        NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
      static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    
    //MARK Types
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        //Initialize stored properties
        self.name = name
        self.photo = photo!
        self.rating = rating
        super.init()
        
        if name.isEmpty || rating < 0 {
            return nil
        }
        
    }
    //MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
        
    }
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        //photo is optional property of meal
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        //call designated initializer
        self.init(name: name, photo: photo, rating: rating)
        
    }
    
}

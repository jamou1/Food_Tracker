//
//  Meal.swift
//  FoodTracker
//
//  Created by James Moulton on 4/20/16.
//  Copyright © 2016 lavaflowmobile. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    var name: String
    var photo: UIImage
    var rating: Int
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        //Initialize stored properties
        self.name = name
        self.photo = photo!
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
        
    }
    
}

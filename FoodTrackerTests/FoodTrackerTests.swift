//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by James Moulton on 1/28/16.
//  Copyright © 2016 lavaflowmobile. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //MARK: Foodtracker Tests
    
    func testMealInitialization() {
        //success case
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        //failure case
        let noName = Meal(name:"", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal("really bad rating", photo: nil, rating: -1)
    }
}

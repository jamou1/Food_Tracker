//
//  RatingControl.swift
//  FoodTracker
//
//  Created by James Moulton on 2/9/16.
//  Copyright © 2016 lavaflowmobile. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //MARK: Properties
    var rating = 0
    var ratingButtons = [UIButton]()

    //MARK: Initialization
    override func layoutSubviews() {
        
        //set button width/height to a square the size of the frame's height
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        //offset each button by the length of the button plus spacing
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        
        for _ in 0..<5 {
            let button = UIButton()
            button.backgroundColor = UIColor.blueColor()
            button.addTarget(self, action: "RatingButtonTapped:", forControlEvents:
                .TouchDown)  //when user has pressed on a rating button
            ratingButtons += [button]  //adding buttons to the array
            addSubview(button)
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + 5) 
        return CGSize(width: width, height: buttonSize)
    }
    //MARK: Button Action
    func RatingButtonTapped(button: UIButton) {
        print("Button Pressed")
    }
}
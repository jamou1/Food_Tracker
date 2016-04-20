//
//  RatingControl.swift
//  FoodTracker
//
//  Created by James Moulton on 2/9/16.
//  Copyright © 2016 lavaflowmobile. All rights reserved.
//

import UIKit

class RatingControl: UIView {  //RatingControl is a subclass of UIView
    
    //MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()  //will trigger a layout update when rating changes
        }
    }
    var ratingButtons = [UIButton]()
    var spacing = 5
    var stars = 5

    //MARK: Initialization
    override func layoutSubviews() {
        
        //set button width/height to a square the size of the frame's height
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        //offset each button by the length of the button plus spacing
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            button.backgroundColor = UIColor.blueColor()
            button.addTarget(self, action: "RatingButtonTapped:", forControlEvents:
                .TouchDown)  //when user has pressed on a rating button
            ratingButtons += [button]  //adding buttons to the array
            addSubview(button)
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars  
        return CGSize(width: width, height: buttonSize)
    }
    //MARK: Button Action
    func RatingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {  //if index of button is less than the rating, then button should be selected
            button.selected = index < rating
        }
    }
}
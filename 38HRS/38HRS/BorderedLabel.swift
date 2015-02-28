//
//  BorderedLabel.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-26.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class BorderedLabel: UILabel {

    private var insets = UIEdgeInsets(top: 5, left: 10, bottom: 3, right: 10)
    
    override func textRectForBounds(bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        
        var rect = super.textRectForBounds(UIEdgeInsetsInsetRect(bounds,self.insets), limitedToNumberOfLines: numberOfLines)
        
        rect.origin.x    -= insets.left
        rect.origin.y    -= insets.top
        rect.size.width  += (insets.left + insets.right)
        rect.size.height += (insets.top + insets.bottom)
        
        return rect
    }
    override func drawRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(bounds,self.insets))
        self.layer.borderColor = greenColor.CGColor
        self.layer.borderWidth = 1.0
    }

}

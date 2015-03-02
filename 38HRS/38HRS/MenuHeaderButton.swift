//
//  MenuHeaderButton.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-28.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit



class MenuHeaderButton: UIButton {
    
    enum HeaderIdentifier {
        case Filters
        case Cities
        case About
        case Other
    }
    
    var identifier = HeaderIdentifier.Other
    private var headerTitleLabel = UILabel()
    private var arrowView = UIImageView()
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        // Title label
        headerTitleLabel.frame.origin.x = contentMargin
        headerTitleLabel.font = UIFont(name: "FuturaStd-Bold", size: 22)
        
        // Arrow image
        var arrowImage = UIImage(named: "right_arrow")
        arrowView.image = arrowImage
        arrowView.sizeToFit()
        arrowView.frame.origin.x = sideMenuWidth - arrowView.frame.width - contentMargin
        arrowView.center.y = self.frame.height/2
        
    }
    
    func setHeaderTitle(title: String){
        headerTitleLabel.text = title
        headerTitleLabel.sizeToFit()
        headerTitleLabel.center.y = self.frame.height/2
        self.addSubview(headerTitleLabel)
    }
    
    func setHeaderIdentifier(id: HeaderIdentifier){
        self.identifier = id
        
        if(id == .Cities || id == .About){
            self.addSubview(arrowView)
        }
    }

}

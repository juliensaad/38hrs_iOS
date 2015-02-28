//
//  SwitchView.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-28.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class SwitchView: UIImageView {

    private var active : Bool!
    
    override func drawRect(rect: CGRect) {
        self.setActive(false)
    }
    
    func setActive(active:Bool){
        self.active = active
        
        // change image acroding to state
        var switchImage : UIImage!
        
        if(active){
            switchImage = UIImage(named: "green_switch")
        }else{
            switchImage = UIImage(named: "gray_switch")
        }
        
        self.image = switchImage
        self.sizeToFit()
    }
    
    func isActive() -> Bool{
        return active
    }

}

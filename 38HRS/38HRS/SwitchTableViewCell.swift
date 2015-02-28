//
//  SwitchTableViewCell.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-28.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    private var switchView = SwitchView()
    private var titleLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        // add switch view
        switchView.drawRect(CGRectMake(0, 0, 0, 0))
        switchView.frame.origin.x = sideMenuWidth - switchView.frame.width - contentMargin
        switchView.center.y = self.frame.height/2
        self.addSubview(switchView)
        
        // add title label
        titleLabel.frame.origin.x = contentMargin+5
        titleLabel.font = UIFont(name: "FuturaStd-Bold", size: 17)
    }
    
    func setTitle(title: String){
        titleLabel.text = title
        titleLabel.sizeToFit()
        titleLabel.frame.size.height = titleLabel.frame.height+5
        titleLabel.center.y = self.frame.height/2
        self.addSubview(titleLabel)
    }
    
    func toggleSwitch(){
        self.switchView.setActive(!self.switchView.isActive())
    }
    
}

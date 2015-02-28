//
//  LocationListItemView.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-28.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class LocationListItemView: UITableViewCell {
    
    private var authorImageDimension : CGFloat = 60
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        var locationImageView = UIImageView(frame: CGRectMake(0, 0, screenWidth, locationImageHeight))
        locationImageView.image = UIImage(named: "loc_image_one")
        self.addSubview(locationImageView)
        
        var authorImageView = UIImageView()
        authorImageView.image = UIImage(named: "loc_image_two")
        authorImageView.frame.size.width = authorImageDimension
        authorImageView.frame.size.height = authorImageDimension
        authorImageView.frame.origin.x = screenWidth - authorImageDimension - contentMargin
        authorImageView.frame.origin.y = locationImageHeight - authorImageDimension/2
        authorImageView.layer.cornerRadius = authorImageView.frame.size.width / 2;
        authorImageView.clipsToBounds = true;
        authorImageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.addSubview(authorImageView)
        
        
        self.sizeToFit()
    }
    

}

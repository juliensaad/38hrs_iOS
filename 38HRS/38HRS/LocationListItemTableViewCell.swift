//
//  LocationListItemView.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-28.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class LocationListItemTableViewCell: UITableViewCell {
    
    private var authorImageDimension : CGFloat = 60
    
    private var locationImageView = UIImageView(frame: CGRectMake(0, 0, screenWidth, locationImageHeight))
    private var authorImageView = UIImageView()
    private var catTag = BorderedLabel()
    private var nameLabel = UILabel()
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        // location image
        locationImageView.image = UIImage(named: "loc_image_two")
        self.addSubview(locationImageView)
        
        // Author image with rounded white border
        authorImageView.image = UIImage(named: "nico")
        
        authorImageView.frame.size.width = authorImageDimension
        authorImageView.frame.size.height = authorImageDimension
        authorImageView.frame.origin.x = screenWidth - authorImageDimension - contentMargin
        authorImageView.frame.origin.y = locationImageHeight - authorImageDimension/2
        
        authorImageView.layer.cornerRadius = authorImageView.frame.size.width / 2;
        authorImageView.layer.borderColor = UIColor.whiteColor().CGColor
        authorImageView.layer.borderWidth = 2
        authorImageView.clipsToBounds = true;
        authorImageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.addSubview(authorImageView)
        
        // Categorie tag
        catTag.frame.origin.x = contentMargin
        catTag.frame.origin.y = locationImageHeight + contentMargin
        
        catTag.text = "Food"
        catTag.textColor = greenColor
        catTag.font = UIFont(name: "FuturaStd-Bold", size: 17)
        catTag.sizeToFit()
        catTag.drawRect(catTag.textRectForBounds(catTag.frame,limitedToNumberOfLines: 0))
        self.addSubview(catTag)
        
        // Name label
        nameLabel.frame.origin.x = contentMargin + catTag.frame.width + smallMargin
        nameLabel.frame.origin.y = locationImageHeight + contentMargin
        
        nameLabel.text = "Kratz orange"
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.font = UIFont(name: "FuturaStd-Bold", size: 17)
        
        self.addSubview(nameLabel)
        
        self.sizeToFit()
    }
    

}

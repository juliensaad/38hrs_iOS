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
    var cellHeight : CGFloat!
    
    var locationImageButton = UIImageView(frame: CGRectMake(0, 0, screenWidth, locationImageHeight))
    private var authorImageView = UIImageView()
    private var catTag = BorderedLabel()
    var nameLabel = UIButton()
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        // location image
        locationImageButton.image = UIImage(named: "loc_image_two")
        locationImageButton.contentMode = UIViewContentMode.ScaleAspectFill
        self.addSubview(locationImageButton)
        
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
        var name = UILabel()
        name.text = "Kratz Orange"
        name.font = UIFont(name: "FuturaStd-Bold", size: 17)
        name.sizeToFit()
        name.frame.size.height += 5
        
        nameLabel.addSubview(name)
        nameLabel.sizeToFit()
        nameLabel.frame.size.width = name.frame.width
        
        nameLabel.frame.origin.x = contentMargin + catTag.frame.width + smallMargin
        nameLabel.center.y = catTag.center.y
            
        name.center.y = nameLabel.frame.height/2
        
        self.addSubview(nameLabel)
        
        self.cellHeight = catTag.frame.origin.y + catTag.frame.height + contentMargin
    }
    
    func getCellHeight() -> CGFloat{
        return self.cellHeight
    }

}

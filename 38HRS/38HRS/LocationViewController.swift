//
//  ViewController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-13.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class LocationViewController: KingViewController {
    
    var location : Location!
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var catTag: BorderedLabel!
    @IBOutlet weak var addItButton: UIButton!
    @IBOutlet weak var descText: UITextView!
    
    @IBOutlet weak var navBackButton: UIBarButtonItem!
    @IBOutlet weak var navAddItButton: UIBarButtonItem!
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var imageScrollView: UIScrollView!
    
    // Index view
    private var imageArray = [UIImage]()
    private var indexViewArray = [UIImageView]()
    private var indexDimen : CGFloat = 20
    private var dotImg = UIImage(named: "image_viewer_dot")
    private var selectedDotImg = UIImage(named: "image_viewer_selected_dot")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageScrollView.delegate = self
        
        imageArray.append(UIImage(named: "loc_image_one")!)
        imageArray.append(UIImage(named: "loc_image_two")!)
        
        setUpImageViewer()
        buildUI()
        
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    func buildUI(){
        // nav bar
        navItem.leftBarButtonItem?.tintColor = darkGrayColor
        navItem.rightBarButtonItem?.tintColor = darkGrayColor
        
        // Cat tag
        catTag.text = location.category.name
        catTag.sizeToFit()
        catTag.textColor = greenColor
        catTag.font = UIFont(name: "FuturaStd-Bold", size: 17)
        
        // Name label
        nameLabel.text = location.name
        
        // Author label
        let underlineAttriString = NSAttributedString(string: "Nathalie S.", attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue])
        authorLabel.attributedText = underlineAttriString
        authorLabel.textColor = greenColor
        
        // Description
        descText.text = location.description
        descText.font = UIFont(name: "FuturaStd-Medium", size: 14)
        descText.layoutIfNeeded()
        descText.sizeToFit()
        
        // Add button
        addItButton.backgroundColor = greenColor
    }
    
    func setUpImageViewer(){
        // IMP
        self.automaticallyAdjustsScrollViewInsets = false
        
        // Create index view
        var indexView = UIView(frame: CGRectMake(0, 0, CGFloat(imageArray.count) * indexDimen, indexDimen))
        
        for var i=0 ; i<imageArray.count ; i++ {
            
            // Create image view in slider
            var imgView = UIImageView(frame: CGRectMake(CGFloat(i)*screenWidth, 0, screenWidth, imageScrollView.frame.height))
            imgView.image = imageArray[i]
            imgView.contentMode = UIViewContentMode.ScaleAspectFill
            imgView.clipsToBounds = true
            imageScrollView.addSubview(imgView)
            
            // Create dot view for slider page
            var dotImageView = UIImageView()
            var dotView = UIView(frame: CGRectMake(CGFloat(i)*indexDimen, 0, indexDimen, indexDimen))
            
            dotImageView.image = dotImg
            dotImageView.sizeToFit()
            dotImageView.center = CGPointMake(indexDimen/2, indexDimen/2)
            dotView.addSubview(dotImageView)
            
            indexView.addSubview(dotView)
            indexViewArray.append(dotImageView)
        }
        
        // Set index view in nav bar
        navItem.titleView = indexView
        
        // Set actual selected slide
        indexViewArray[0].image = UIImage(named: "image_viewer_selected_dot")
        indexViewArray[0].sizeToFit()
        indexViewArray[0].center = CGPointMake(indexDimen/2, indexDimen/2)
        
        // Content size
        imageScrollView.contentSize = CGSizeMake(CGFloat(imageArray.count)*screenWidth, imageScrollView.frame.size.height)
    }
    
    @IBAction func didPressNavAddButton(sender: AnyObject) {
    }
    @IBAction func didPressNavBackButton(sender: AnyObject) {
        self.directNavigationController.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

// MARK: UIScrollViewDelegate
extension LocationViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        // Get current page
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        // Reset every index
        for var i=0 ; i<indexViewArray.count ; i++ {
            indexViewArray[i].image = dotImg
            indexViewArray[i].sizeToFit()
            indexViewArray[i].center = CGPointMake(indexDimen/2, indexDimen/2)
        }
        
        // Set selected page index
        indexViewArray[page].image = selectedDotImg
        indexViewArray[page].sizeToFit()
        indexViewArray[page].center = CGPointMake(indexDimen/2, indexDimen/2)
    }
}


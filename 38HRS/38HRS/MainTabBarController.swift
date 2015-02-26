//
//  MainTabBarController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-24.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let tabBarWidth : CGFloat = screenWidth/2
    let tabBarHeight : CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.designTabBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func designTabBar(){
        
        // Design Tab Bar
        self.tabBar.barTintColor = UIColor.whiteColor()
        self.tabBar.selectedImageTintColor = greenColor
        self.tabBar.frame.size.width = tabBarWidth
        self.tabBar.frame.inset(dx: 0, dy: 10)
        
        // Add white padding to the right
        var tabBarPaddingView = UIView(frame: CGRectMake(tabBarWidth, screenHeight - tabBarHeight + 0.5, screenWidth - tabBarWidth, tabBarHeight - 0.5))
        var topBorder = UIView(frame: CGRectMake(0, screenHeight - tabBarHeight + 0.5, screenWidth, 0.5))
        topBorder.backgroundColor = lightGrayColor
        tabBarPaddingView.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(tabBarPaddingView)
        self.view.addSubview(topBorder)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  MainNavigationController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-26.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class MainNavigationController: ENSideMenuNavigationController  {

    var coverView = UIView(frame: CGRectMake(0, 0, screenWidth, screenHeight))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        sideMenu = ENSideMenu(sourceView: self.view, menuTableViewController: MenuTableViewController(), menuPosition:.Left)
        
        sideMenu?.menuWidth = sideMenuWidth
        
        coverView.backgroundColor = UIColor.darkGrayColor()
        coverView.alpha = 0.5
        coverView.hidden = true
        self.view.addSubview(coverView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showMenu(){
        
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

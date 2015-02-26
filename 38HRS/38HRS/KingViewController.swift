//
//  KingViewController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-24.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class KingViewController: UIViewController, ENSideMenuDelegate {

    var mainNavigationController : MainNavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainNavigationController = (self.navigationController as MainNavigationController)
        
        mainNavigationController.navigationBar.translucent = false
        mainNavigationController.navigationBar.opaque = true
        self.extendedLayoutIncludesOpaqueBars = true
        
        self.sideMenuController()?.sideMenu?.delegate = self;
    }
    
    override func viewDidLayoutSubviews() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        println("sideMenuWillOpen")
        mainNavigationController.coverView.hidden = false
    }
    
    func sideMenuWillClose() {
        println("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        println("sideMenuShouldOpenSideMenu")
        return true;
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

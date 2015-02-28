//
//  MainNavigationController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-26.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class MainNavigationController: ENSideMenuNavigationController  {

    var coverView = UIButton(frame: CGRectMake(0, 0, screenWidth, screenHeight))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.translucent = false
        self.navigationBar.opaque = true
        
        sideMenu = ENSideMenu(sourceView: self.view, menuTableViewController: MenuTableViewController(), menuPosition:.Left)
        sideMenu?.menuWidth = sideMenuWidth
        sideMenu?.bouncingEnabled = false
        sideMenu?.delegate = self;
        
        coverView.backgroundColor = UIColor.blackColor()
        coverView.alpha = 0
        coverView.hidden = true
        coverView.addTarget(self, action: "didClickCoverView:", forControlEvents: .TouchUpInside)
        self.view.addSubview(coverView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didClickCoverView(sender: UIButton!){
        sideMenu?.hideSideMenu()
    }
    
    func showCover(){
        let transitionOptions = UIViewAnimationOptions.CurveLinear
        
        coverView.hidden = false
        
        UIView.transitionWithView(self.view, duration: 0.5, options: transitionOptions, animations: {
            
            self.coverView.alpha = 0.7
            
            }, completion: { finished in
        })
        
    }
    
    func hideCover(){
        let transitionOptions = UIViewAnimationOptions.CurveEaseOut
        
        UIView.transitionWithView(self.view, duration: 0.5, options: transitionOptions, animations: {
            
            self.coverView.alpha = 0
            
            }, completion: { finished in
            
                self.coverView.hidden = true
        })
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

// MARK: - ENSideMenu Delegate
extension MainNavigationController: ENSideMenuDelegate{
    
    func sideMenuWillOpen() {
        self.showCover()
    }
    
    func sideMenuWillClose() {
        self.hideCover()
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        return true;
    }
    
}

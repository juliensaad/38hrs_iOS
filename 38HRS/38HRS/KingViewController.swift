//
//  KingViewController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-24.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class KingViewController: UIViewController {

    var mainNavigationController : MainNavigationController!
    var directNavigationController : UINavigationController!
    
    let modelSingleton = ModelInterfaceSingleton.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(self.tabBarController != nil){
            mainNavigationController = (self.tabBarController as MainTabBarController).getNavigationController()
        }
        directNavigationController = self.navigationController
        
        self.extendedLayoutIncludesOpaqueBars = true
    }
    
    func detectContentState(){
        if(modelSingleton.contentLoaded){
            updateUI()
        }else{
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateUI", name: contentLoadNotificationKey, object: nil)
        }
    }
    
    func updateUI(){}
    
    override func viewDidLayoutSubviews() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

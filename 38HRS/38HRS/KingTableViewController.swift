//
//  KingTableViewController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-03-02.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class KingTableViewController: UITableViewController {

    var mainNavigationController : MainNavigationController!
    var directNavigationController : UINavigationController!
    
    let modelSingleton = ModelInterfaceSingleton.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(self.tabBarController != nil){
            mainNavigationController = (self.tabBarController as MainTabBarController).getNavigationController()
        }
        if(self.navigationController != nil){
            directNavigationController = self.navigationController
        }
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

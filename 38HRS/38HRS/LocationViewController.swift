//
//  ViewController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-13.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class LocationViewController: KingViewController {
    
    let modelSingleton = ModelInterfaceSingleton.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //modelSingleton.getAppContent()
        self.view.backgroundColor = greenColor
        
        //locationImage.image = modelSingleton.loadImage()
        //label.text = "coucou";
        //label.font = UIFont(name: "FuturaStd-Bold", size: 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//
//  ViewController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-13.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    let modelSingleton = ModelInterfaceSingleton.sharedInstance
    
    @IBOutlet weak var locationImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //modelSingleton.getAppContent()
        
        locationImage.image = modelSingleton.loadImage();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


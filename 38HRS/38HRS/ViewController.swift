//
//  ViewController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-13.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var client = CDAClient(spaceKey:"kmyecir7ff4o", accessToken:"9c37d701db210840f3b6f52c7f1538b937542f0af1e96a8e10615d9ec69cc0e7")
        
        var contentSpace: CDASyncedSpace!
        
        client.initialSynchronizationWithSuccess({ (response: CDAResponse!, space : CDASyncedSpace!) -> Void in
            println(space.syncToken)
            println(space.entries)
            contentSpace = space
            }, failure: { (response: CDAResponse!, error: NSError!) -> Void in
                println(error)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


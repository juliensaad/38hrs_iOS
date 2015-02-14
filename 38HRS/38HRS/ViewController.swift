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
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var client = CDAClient(spaceKey:"kmyecir7ff4o", accessToken:"9c37d701db210840f3b6f52c7f1538b937542f0af1e96a8e10615d9ec69cc0e7")
        
        
        if defaults.objectForKey("entries") != nil {
            
            println("From defaults : ")
            
            var entriData = defaults.objectForKey("entries") as NSData
            var entries = NSKeyedUnarchiver.unarchiveObjectWithData(entriData) as NSArray
            println(entries)
            
        }else{
        
        client.initialSynchronizationWithSuccess({ (response: CDAResponse!, space : CDASyncedSpace!) -> Void in
            
            println("From web : ")
            println(space.entries);
            
            var entriData = NSKeyedArchiver.archivedDataWithRootObject(space.entries)
            
            defaults.setObject(entriData, forKey: "entries")
            defaults.synchronize()
            
            //var alex = ami(name: "coucou",age: 22)
            
            //var manager = CDAPersistenceManager()
            
            }, failure: { (response: CDAResponse!, error: NSError!) -> Void in
                println(error)
        })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


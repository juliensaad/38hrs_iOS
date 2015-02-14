//
//  ViewController.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-13.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    internal var amis : [ami] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        var client = CDAClient(spaceKey:"kmyecir7ff4o", accessToken:"9c37d701db210840f3b6f52c7f1538b937542f0af1e96a8e10615d9ec69cc0e7")
        
        
        if defaults.objectForKey("entries") != nil {
            
            println("From defaults : ")
            
            var entriData = defaults.objectForKey("entries") as NSData
            var entries = NSKeyedUnarchiver.unarchiveObjectWithData(entriData) as NSArray
            self.createModelEntries(entries)
            
        }else{
        
            client.initialSynchronizationWithSuccess({ (response: CDAResponse!, space : CDASyncedSpace!) -> Void in
                
                println("From web : ")
                
                self.createModelEntries(space.entries)
                
                var entriData = NSKeyedArchiver.archivedDataWithRootObject(space.entries)
                
                defaults.setObject(entriData, forKey: "entries")
                defaults.synchronize()
                
                }, failure: { (response: CDAResponse!, error: NSError!) -> Void in
                    println(error)
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createModelEntries(entriesArray :NSArray){
        
        for var i=0 ; i<entriesArray.count ; i++ {
            var entry = entriesArray[i] as CDAEntry
            self.amis.append(ami(name: entry.fields["name"] as String, age: entry.fields["age"] as Int))
        }
        
        for ami in self.amis {
            println(ami.name)
            println(ami.age)
        }
    }
}


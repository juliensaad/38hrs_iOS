//
//  ModelInterface.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-20.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import Foundation

class ModelInterfaceSingleton{
    
    private var client = CDAClient(spaceKey:"vf9b8vvy97rq", accessToken:"6bba073a3322e16abcb71dc025666a3247f54bca1e043aeea6f5315047e2bf4f")
    private var defaults = NSUserDefaults.standardUserDefaults()
    
    class var sharedInstance: ModelInterfaceSingleton {
        struct Static {
            static var instance: ModelInterfaceSingleton?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = ModelInterfaceSingleton()
        }
        
        return Static.instance!
    }
    
    func getAppContent(){
        
        if defaults.objectForKey("entries") != nil && defaults.objectForKey("assets") != nil {
            
            println("From defaults : ")
            
            var entriData = defaults.objectForKey("entries") as NSData
            var entries = NSKeyedUnarchiver.unarchiveObjectWithData(entriData) as NSArray
            var assetData = defaults.objectForKey("assets") as NSData
            var assets = NSKeyedUnarchiver.unarchiveObjectWithData(assetData) as NSArray
            
        }else{
            
            client.initialSynchronizationWithSuccess({ (response: CDAResponse!, space : CDASyncedSpace!) -> Void in
                
                println("From web : ")
                
                var entriData = NSKeyedArchiver.archivedDataWithRootObject(space.entries)
                var assetData = NSKeyedArchiver.archivedDataWithRootObject(space.assets)
                
                self.defaults.setObject(entriData, forKey: "entries")
                self.defaults.setObject(assetData, forKey: "assets")
                self.defaults.synchronize()
                
                }, failure: { (response: CDAResponse!, error: NSError!) -> Void in
                    println(error)
            })
        }
        
    }
    
    private func createModelEntries(entriesArray :NSArray){
        
        for var i=0 ; i<entriesArray.count ; i++ {
            var entry = entriesArray[i] as CDAEntry
            // self.amis.append(ami(name: entry.fields["name"] as String, age: entry.fields["age"] as Int))
        }
        
    }
}

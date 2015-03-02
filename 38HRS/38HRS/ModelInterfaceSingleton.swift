//
//  ModelInterface.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-20.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import Foundation

class ModelInterfaceSingleton{
    
    private var defaults = NSUserDefaults.standardUserDefaults()
    let reachability: Reachability = Reachability.reachabilityForInternetConnection()
    
    var locations = [Location]()
    
    // Singleton logic
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
    
    // Get content from contentful or from defaults depending on connectivity
    func getAppContent(){
        
        if Reachability.isReachableViaWiFi(reachability)() {
         
            var client = CDAClient(spaceKey:"vf9b8vvy97rq", accessToken:"6bba073a3322e16abcb71dc025666a3247f54bca1e043aeea6f5315047e2bf4f")

            client.initialSynchronizationWithSuccess({ (response: CDAResponse!, space : CDASyncedSpace!) -> Void in
                
                println("From web : ")
                
                self.createModelEntries(space.entries)
                // self.downloadAllAssets(space.assets)
             
                var entriData = NSKeyedArchiver.archivedDataWithRootObject(space.entries)
                var assetData = NSKeyedArchiver.archivedDataWithRootObject(space.assets)
                
                self.defaults.setObject(entriData, forKey: "entries")
                self.defaults.setObject(assetData, forKey: "assets")
                self.defaults.synchronize()
                
                }, failure: { (response: CDAResponse!, error: NSError!) -> Void in
                    println(error)
            })
            
        }else if defaults.objectForKey("entries") != nil && defaults.objectForKey("assets") != nil {
            
            println("From defaults : ")
            
            var entriData = defaults.objectForKey("entries") as NSData
            var entries = NSKeyedUnarchiver.unarchiveObjectWithData(entriData) as NSArray
            var assetData = defaults.objectForKey("assets") as NSData
            var assets = NSKeyedUnarchiver.unarchiveObjectWithData(assetData) as NSArray
            
            // self.createModelEntries(entries)
        }

    }
    
    private func createModelEntries(entriesArray :NSArray){
        
        for var i=0 ; i<entriesArray.count ; i++ {
            var entry = entriesArray[i] as CDAEntry
            
            if(entry.contentType.name == "Location"){
                var location = Location(id: entry.identifier as String)

              //  location.name = entry.fields["name"]? as String
                //location.category = entry.fields["category"]? as String

                println(entry.fields["name"]? as String)
            }
            // self.amis.append(ami(name: entry.fields["name"] as String, age: entry.fields["age"] as Int))
        }
        
    }
    
    private func downloadAllAssets(assetsArray :NSArray){
        
        for var i=0 ; i<assetsArray.count ; i++ {
            var asset = assetsArray[i] as CDAAsset
            self.getImageFromUrl(asset.URL)
        }
        println("done")
    }
    
    private func getImageFromUrl(url : NSURL){
        let data = NSData(contentsOfURL: url)
        
        if(data != nil){
            let image = UIImage(data: data!)!
            
            let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
            let destinationPath = documentsPath.stringByAppendingPathComponent("filename.jpg")
            UIImageJPEGRepresentation(image,1.0).writeToFile(destinationPath, atomically: true)
        }
    }
    
    func loadImage() -> UIImage{
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let destinationPath = documentsPath.stringByAppendingPathComponent("filename.jpg")
        
        return UIImage(contentsOfFile: destinationPath)!
    }
}

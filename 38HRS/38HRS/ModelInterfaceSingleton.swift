//
//  ModelInterface.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-20.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import Foundation

class ModelInterfaceSingleton{
    
    private let spaceKey = "vf9b8vvy97rq"
    private let accessTolken = "6bba073a3322e16abcb71dc025666a3247f54bca1e043aeea6f5315047e2bf4f"
    
    private var defaults = NSUserDefaults.standardUserDefaults()
    let reachability: Reachability = Reachability.reachabilityForInternetConnection()
    
    var contentLoaded = false
    var locations = [Location]()
    var categories = [Category]()
    var curators = [Curator]()
    
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
    
    // MARK: Content loading
    // Get content from contentful or from defaults depending on connectivity
    func getAppContent(){
        
        if Reachability.isReachableViaWiFi(reachability)() {
         
            var client = CDAClient(spaceKey:self.spaceKey, accessToken:self.accessTolken)

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
            
            self.createModelEntries(entries)
        }

    }
    
    private func downloadAllAssets(assetsArray :NSArray){
        
        for var i=0 ; i<assetsArray.count ; i++ {
            var asset = assetsArray[i] as CDAAsset
            self.saveAssetFromURL(asset)
        }
        println("done")
    }
    
    private func saveAssetFromURL(asset : CDAAsset){
        let data = NSData(contentsOfURL: asset.URL)
        
        if(data != nil){
            let image = UIImage(data: data!)!
            
            let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
            let destinationPath = documentsPath.stringByAppendingPathComponent("filename.jpg")
            UIImageJPEGRepresentation(image,1.0).writeToFile(destinationPath, atomically: true)
        }
    }
    
    func getLocalImage() -> UIImage{
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let destinationPath = documentsPath.stringByAppendingPathComponent("filename.jpg")
        
        return UIImage(contentsOfFile: destinationPath)!
    }
    
    // MARK: Model Creation
    private func createModelEntries(entriesArray :NSArray){
        
        for var i=0 ; i<entriesArray.count ; i++ {
            var entry = entriesArray[i] as CDAEntry
            
            if(entry.contentType.name == "Category"){
                addCategory(entry)
            }
            
            if(entry.contentType.name == "Curator"){
                addCurator(entry)
            }
            
            if(entry.contentType.name == "Location"){
                addLocation(entry)
                /*for var j=0 ; j<entry.fields.keys.array.count ; j++ {
                    println(entry.fields.keys.array[j])
                }
                println("-----------")*/
            }
        }
        
        self.contentLoaded = true
        NSNotificationCenter.defaultCenter().postNotificationName(contentLoadNotificationKey, object: self)
    }
    
    private func addLocation(entry: CDAEntry){
        
        // Location already exist or has no name
        if(getLocationFromId(entry.identifier) != nil || entry.fields["name"] == nil){
            return
        }
        
        var location = Location(id: entry.identifier as String, name: entry.fields["name"]? as String)
        
        if(entry.fields["description"] != nil){
            location.description = entry.fields["description"]? as String
        }
        if(entry.fields["category"] != nil){
            var catEntry = entry.fields["category"] as CDAEntry
            addCategory(catEntry)
            location.category = getCategoryFromId(catEntry.identifier)
        }
        if(entry.fields["curator"] != nil){
            var curEntry = entry.fields["curator"] as CDAEntry
            addCurator(curEntry)
            location.curator = getCuratorFromId(curEntry.identifier)
        }
        
        self.locations.append(location)
    }
    
    private func addCategory(entry: CDAEntry){
        
        // Category already exists or has no name
        if(getCategoryFromId(entry.identifier) != nil || entry.fields["category"] == nil){
            return
        }
        
        var category = Category(id: entry.identifier, name: entry.fields["category"]? as String)
        self.categories.append(category)
    }
    
    private func addCurator(entry: CDAEntry){
        
        // Curator already exists or has no name
        if(getCuratorFromId(entry.identifier) != nil || entry.fields["name"] == nil){
            return
        }
        
        var curator = Curator(id: entry.identifier, name: entry.fields["name"]? as String)
        self.curators.append(curator)
    }
    
    func getCategoryFromId(id: String) -> Category?{
        for cat in self.categories{
            if(cat.identifier == id){
                return cat
            }
        }
        return nil
    }
    
    func getLocationFromId(id: String) -> Location?{
        for loc in self.locations{
            if(loc.identifier == id){
                return loc
            }
        }
        return nil
    }
    
    func getCuratorFromId(id: String) -> Curator?{
        for cur in self.curators{
            if(cur.identifier == id){
                return cur
            }
        }
        return nil
    }
}

//
//  ConnectivityManager.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-02-20.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import Foundation

class ConnectivityManager {
    
    class func hasWifiConnection() {
        let reachability: Reachability = Reachability.reachabilityForInternetConnection()
        println(Reachability.isReachableViaWiFi(reachability)())
    }
}
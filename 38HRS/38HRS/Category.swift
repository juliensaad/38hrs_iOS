//
//  Category.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-03-02.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import Foundation

class Category: EntryModel {
    
    private var isFilter = true
    
    func toggleFilter(){
        isFilter = !isFilter
        NSNotificationCenter.defaultCenter().postNotificationName(filterChangeNotificationKey, object: self)
    }
    
    func getFilter() -> Bool{
        return isFilter
    }
}
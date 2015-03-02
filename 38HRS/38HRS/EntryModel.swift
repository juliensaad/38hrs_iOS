//
//  EntryModel.swift
//  38HRS
//
//  Created by Nicolas St-Aubin on 2015-03-02.
//  Copyright (c) 2015 Nicolas St-Aubin. All rights reserved.
//

import Foundation

class EntryModel {
    var identifier : String!
    var name : String!
    
    init(id: String, name: String){
        self.identifier = id
        self.name = name
    }
}
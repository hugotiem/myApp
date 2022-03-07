//
//  Restaurant.swift
//  MyApp2
//
//  Created by Thomas RIVIERE on 05/03/2022.
//

import Foundation

class Restaurant {
    var id : String!
        var name : String!
        var address: String!
        var tags : [String]!


        public init(id:String, name:String, address:String, tags:[String]){
            self.id = id
            self.name = name
            self.address = address
            self.tags = tags
        }

}


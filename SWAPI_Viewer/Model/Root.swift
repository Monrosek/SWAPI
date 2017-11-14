//
//  Root.swift
//  SWAPI_Viewer
//
//  Created by Mac on 11/4/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//
import UIKit


struct Categories: Codable {
    var films:String
    var people:String
    var planets:String
    var species:String
    var starships:String
    var vehicles:String
}


enum Type: String, Codable {
    case films = "films"
    case people = "people"
    case planets = "planets"
    case species = "species"
    case starships = "starships"
    case vehicles = "vehicles"
}

struct Model {
    var name:String
   var type:Type
   var url:String
   init? (name: String,type: Type, url:String) {
        self.name = name
        self.type = type
        self.url = url
    }
    
   init?(type: Type, url:String) {
        self.type = type
        self.name = type.rawValue
        self.url = url
    }
}




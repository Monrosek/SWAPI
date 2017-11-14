//
//  Planets.swift
//  Planet
//
//  Created by Mac on 11/4/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit


struct Planets:Codable {
    var count:Int
    var next:String?
    var previous:String?
    var results:[Planet]
}

struct Planet:Codable {
    var name:String
    var diameter:String
    var rotation_period:String
    var orbital_period:String
    var gravity:String
    var population:String
    var climate:String
    var terrain:String
    var surface_water:String
    var residents:[String]
    var films:[String]
    var url:String
    var created:String
    var edited:String
}



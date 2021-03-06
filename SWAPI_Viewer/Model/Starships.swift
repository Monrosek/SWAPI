//
//  Starships.swift
//  Kendell Monrose
//
//  Created by Mac on 11/3/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

struct Starships:Codable {
    var count:Int
    var next:String?
    var previous:String?
    var results:[Starship]
}

struct Starship:Codable {
    var name:String
    var model:String
    var starship_class:String
    var manufacturer:String
    var cost_in_credits:String
    var length:String
    var crew:String
    var passengers:String
    var max_atmosphering_speed:String
    var hyperdrive_rating:String
    var MGLT:String
    var cargo_capacity:String
    var consumables:String
    var films:[String]
    var pilots:[String]
    var url:String
    var created:String
    var edited:String
}


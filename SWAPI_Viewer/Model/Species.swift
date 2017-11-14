//
//  Species.swift
//  Kendell Monrose
//
//  Created by Mac on 11/3/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

struct Species:Codable {
    var count:Int
    var next:String?
    var previous:String?
    var results:[race]
}

struct race: Codable {
    var name:String
    var classification:String
    var designation:String
    var average_height:String
    var average_lifespan:String
    var eye_colors:String
    var hair_colors:String
    var skin_colors:String
    var language:String
    var homeworld:String?
    var people:[String]
    var films:[String]
    var url:String
    var created:String
    var edited:String
}


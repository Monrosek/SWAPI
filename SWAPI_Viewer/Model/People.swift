//
//  People.swift
//  Kendell Monrose
//
//  Created by Mac on 11/3/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

struct People:Codable {
    var count:Int
    var next:String?
    var previous:String?
    var results:[Person]
}


class Person:Codable {
    var name:String
    var birth_year:String
    var eye_color:String
    var gender:String
    var hair_color:String
    var height:String
    var mass:String
    var skin_color:String
    var homeworld:String
    var films:[String]
    var species:[String]
    var starships:[String]
    var vehicles:[String]
    var url:String
    var created:String
    var edited:String
}



//
//  Films.swift
//  Kendell Monrose
//
//  Created by Mac on 11/3/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

struct Films:Codable {
    var count:Int
    var next:String?
    var previous:String?
    var results:[Film]
    }

struct Film:Codable {
    var title:String
    var episode_id:Int
    var opening_crawl:String
    var director:String
    var producer:String
    var release_date:String
    var species:[String]
    var starships:[String]
    var vehicles:[String]
    var characters:[String]
    var planets:[String]
    var url:String
    var created:String
    var edited:String
}


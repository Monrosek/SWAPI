//
//  GlobalCache.swift
//  Kendell Monrose
//
//  Created by Mac on 11/4/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//
import UIKit

class GlobalCache {
    static let shared = GlobalCache()
    let imageCache = NSCache<NSString,UIImage>()
    let nameCache = NSCache<NSString,AnyObject>()
}


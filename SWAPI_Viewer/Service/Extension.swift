//
//  Extension.swift
//  SWAPI_Viewer
//
//  Created by Mac on 11/13/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit


extension UIImageView {
    
    func imageFrom(url: String) {
        let cache = GlobalCache.shared.imageCache
        if let image = cache.object(forKey: url as NSString) {
            self.image = image
            return
        }
        
        NetworkingService.getImage(from: url) { (image,error) in
            guard error == nil else {return}
            guard let image = image else {return}
            cache.setObject(image, forKey: url as NSString)
            DispatchQueue.main.sync {
                self.image = image
            }
        }
    }
}
/*
 class func getCachedPokemon(url: String) -> Pokemon? {
 let cache = GlobalCache.shared.pokeCache
 if let obj = cache.object(forKey: url as NSString) {
 if let poke = obj as? Pokemon {
 return poke
 }
 }
 
 getPokemon(from: url) { (poke,error) in
 guard error == nil else {return}
 guard let poke = poke else {return}
 cache.setObject(poke as AnyObject, forKey: url as NSString)
 DispatchQueue.main.sync {
 return poke
 }
 }
 return nil
 }
 */
extension labelDetailItem {
    
    func nameFrom(url: String) {
        let cache = GlobalCache.shared.nameCache
        if let obj = cache.object(forKey: url as NSString) {
            if let name = obj as? String {
                self.label = name
            }
            return
        }
        
        NetworkingService.getName(from: url) { (name,error) in
            guard error == nil else {return}
            guard let name = name else {return}
            cache.setObject(name as AnyObject, forKey: url as NSString)
            DispatchQueue.main.sync {
                self.label = name
            }
        }
    }
}

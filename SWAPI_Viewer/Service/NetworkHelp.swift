//
//  NetworkingHelp.swift
//  Kendell Monrose
//
//  Created by Mac on 11/4/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.

import UIKit

class Dispatch {
    static let shared = Dispatch()
    let group = DispatchGroup()
}


enum NetworkError:Error{
    case BadURL
    case NoDataOnServer
    case DataContainedNoImage
}

class NetworkingService {
    
    class func getImage(from url:String,completionHandler:@escaping(UIImage?,Error?)->()){
        guard let url = URL(string:url) else {
            completionHandler(nil, NetworkError.BadURL)
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            guard let data = data else {
                completionHandler(nil, NetworkError.NoDataOnServer)
                return
            }
           // print(String(data: data, encoding: .utf8) ?? "nothing")
            guard let image = UIImage(data: data) else {
                completionHandler(nil, NetworkError.DataContainedNoImage)
                return
            }
            completionHandler(image, nil)
        }
        task.resume()
    }
    
    class func getName(from url:String,completionHandler:@escaping(String?,Error?)->()){
        guard let url = URL(string:url) else {
            completionHandler(nil, NetworkError.BadURL)
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            guard let data = data else {
                completionHandler(nil, NetworkError.NoDataOnServer)
                return
            }
          //  print(String(data: data, encoding: .utf8) ?? "nothing")
            guard let name = String(data: data, encoding: String.Encoding.utf8) as String! else {
                completionHandler(nil, NetworkError.DataContainedNoImage)
                return
            }
            completionHandler(name, nil)
        }
        task.resume()
    }
}



//extension labelDetailItem {
//    func nameFrom(url: String) {
//        let cache = GlobalCache.shared.nameCache
//        if let name = cache.object(forKey: url as NSString) {
//            self.label = String(describing: name)
//            return
//        }
//        
//        NetworkingService.getName(from: url) {(name,error) in
//            guard error == nil else {return}
//            guard let name = name else {return}
//            cache.setObject(name as! NSObject, forKey: url as NSString)
//            DispatchQueue.main.sync {
//                self.label = name
//            }
//        }
//    }
//}
//



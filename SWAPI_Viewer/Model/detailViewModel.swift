//
//  detailViewModel.swift
//  SWAPI_Viewer
//
//  Created by Mac on 11/5/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit


enum detailType {
    case label
    case image
    case list
    case films
    case people
    case planets
    case species
    case starships
    case vehicles
}


protocol detailItem {
    var type: detailType {get}
    var rowCount: Int {get}
    var sectionTitle: String {get}
}

extension detailItem {
    var rowCount: Int {
        return 1
    }
}

class DetailViewModel: NSObject {
    var items = [detailItem]()
    var index = Int()
    init(profile:Profile) {

        super.init()
        
        if let label = profile.name {
            let imageItem = imageDetailItem(imageURL: label)
            imageItem.sectionTitle = label
            items.append(imageItem)
        }
        
        if let label = profile.title {
            let imageItem = imageDetailItem(imageURL: label)
            imageItem.sectionTitle = "Title"
            items.append(imageItem)
        }
        if let label = profile.birth_year {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Birth Year"
            items.append(labelItem)
        }
        if let label = profile.eye_color {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Eye Color"
            items.append(labelItem)
        }
        if let label = profile.gender {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Gender"
            items.append(labelItem)
        }
        if let label = profile.hair_color {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Hair Color"
            items.append(labelItem)
        }
        if let label = profile.height {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Height"
            items.append(labelItem)
        }
        if let label = profile.mass {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Mass"
            items.append(labelItem)
        }
        if let label = profile.skin_color {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Skin Color"
            items.append(labelItem)
        }
        if let label = profile.homeworld {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Home World"
            items.append(labelItem)
        }
        
        if let label = profile.model {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Model"
            items.append(labelItem)
        }
        if let label = profile.vehicle_class {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Vehicle class"
            items.append(labelItem)
        }
        if let label = profile.manufacturer {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Manufacturer"
            items.append(labelItem)
        }
        if let label = profile.length {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Length"
            items.append(labelItem)
        }
        if let label = profile.cost_in_credits {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Cost in credits"
            items.append(labelItem)
        }
        if let label = profile.crew {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Crew"
            items.append(labelItem)
        }
        if let label = profile.passengers {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Passengers"
            items.append(labelItem)
        }
        if let label = profile.max_atmosphering_speed {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Max Atmosphering Speed"
            items.append(labelItem)
        }
        if let label = profile.cargo_capacity {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Cargo Capacity"
            items.append(labelItem)
        }
        if let label = profile.consumables {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Consumables"
            items.append(labelItem)
        }

        if let label = profile.diameter {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Diameter"
            items.append(labelItem)
        }
        if let label = profile.rotation_period {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Rotation Period"
            items.append(labelItem)
        }
        if let label = profile.orbital_period {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Orbital Period"
            items.append(labelItem)
        }
        if let label = profile.gravity {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Gravity"
            items.append(labelItem)
        }
        if let label = profile.population {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Population"
            items.append(labelItem)
        }
        if let label = profile.climate {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Climate"
            items.append(labelItem)
        }
        if let label = profile.terrain {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "terrain"
            items.append(labelItem)
        }
        if let label = profile.surface_water {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "surface_water"
            items.append(labelItem)
        }
 
        if let label = profile.episode_id {
            let labelItem = labelDetailItem(label: String(label))
            labelItem.sectionTitle = "Episode ID"
            items.append(labelItem)
        }
        if let label = profile.opening_crawl {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "opening_crawl"
            items.append(labelItem)
        }
        if let label = profile.director {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "director"
            items.append(labelItem)
        }
        if let label = profile.producer {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "producer"
            items.append(labelItem)
        }
        if let label = profile.release_date {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "release_date"
            items.append(labelItem)
        }

        if let label = profile.classification {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "classification"
            items.append(labelItem)
        }
        if let label = profile.designation {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "designation"
            items.append(labelItem)
        }
        if let label = profile.average_height {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "average_height"
            items.append(labelItem)
        }
        if let label = profile.average_lifespan {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "average_lifespan"
            items.append(labelItem)
        }
        if let label = profile.hyperdrive_rating {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "hyperdrive_rating"
            items.append(labelItem)
        }
        if let label = profile.MGLT {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "MGLT"
            items.append(labelItem)
        }
        if let label = profile.starship_class {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "starship_class"
            items.append(labelItem)
        }
        if let label = profile.hair_colors {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Hair color"
            items.append(labelItem)
        }
        if let label = profile.eye_colors {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Eye Color"
            items.append(labelItem)
        }
        if let label = profile.language {
            let labelItem = labelDetailItem(label: label)
            labelItem.sectionTitle = "Language"
            items.append(labelItem)
        }
        
        if let list = profile.residents {
            let listItem = listDetailItem(list: list,section: "Residents")
            items.append(listItem)
        }
        
        if let list = profile.species {
            let listItem = listDetailItem(list: list,section: "Species")
            items.append(listItem)
        }
        
        if let list = profile.pilots {
            let listItem = listDetailItem(list: list,section: "Pilots")
            items.append(listItem)
        }
        if let list = profile.vehicles {
            let listItem = listDetailItem(list: list,section: "Vehicles")
            items.append(listItem)
        }
        
        if let list = profile.films {
            let listItem = listDetailItem(list: list,section: "Films")
            items.append(listItem)
        }
        
        if let list = profile.characters {
            let listItem = listDetailItem(list: list,section: "Characters")
            items.append(listItem)
        }
        if let list = profile.planets {
            let listItem = listDetailItem(list: list,section: "Planets")
            items.append(listItem)
        }
        
        if let list = profile.starships {
            let listItem = listDetailItem(list: list,section: "Starships")
            items.append(listItem)
        }
       Dispatch.shared.group.leave()
    }
}

class imageDetailItem: detailItem {
    var imageURL: String
    var sectionTitle = String()

    var type: detailType {
        return .image
    }
    
    init(imageURL: String){
     let imgURL = (imageURL).components(separatedBy: " ").joined()
     self.imageURL = "https://raw.githubusercontent.com/kendellm/SWAPI/master/" + imgURL + ".png"
    }
}

class labelDetailItem: detailItem {
    var label:String
    var sectionTitle = String()
    var url = String()
    var type: detailType {
        return .label
    }
    
    init(label: String){
        self.label = label
        self.sectionTitle = ""
        self.url = label
    }
    
    convenience init(label:String, section:String) {
        self.init(label: label)
        self.sectionTitle = section
    }
    
    func getName() ->String {
        Dispatch.shared.group.enter()
        let profile = Profile(json:url)
        
        Dispatch.shared.group.notify(queue: DispatchQueue.main) {
            switch(self.type){
            case .films:
                self.label = profile?.title ?? ""
            default:
                self.label = profile?.name ?? ""
            }
        }
      return label
    }
}

class listDetailItem: detailItem {
    var list:[labelDetailItem] = []
    var sectionTitle = String()
    
    var type: detailType {
        return .list
    }
    
    var rowCount: Int {
        return list.count
    }
    
    init(list: [String], section: String){
        self.sectionTitle = section
        for item in list {
            let labelItem = labelDetailItem(label: item)
            labelItem.sectionTitle = sectionTitle
            self.list.append(labelItem)
        }
    }
    
   // init(list: [String], names: [String], section)
    
    
}





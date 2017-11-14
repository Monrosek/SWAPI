//
//  Profile.swift
//  StarWarsAPI
//
//  Created by Mac on 11/5/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit


class Profile {
    var name:String?
    var birth_year:String?
    var eye_color:String?
    var gender:String?
    var hair_color:String?
    var height:String?
    var mass:String?
    var skin_color:String?
    var homeworld:String?
    var films:[String]?
    var species:[String]?
    var starships:[String]?
    var vehicles:[String]?
    var model:String?
    var vehicle_class:String?
    var manufacturer: String?
    var length:String?
    var cost_in_credits:String?
    var crew:String?
    var passengers:String?
    var max_atmosphering_speed:String?
    var cargo_capacity:String?
    var consumables:String?
    var pilots:[String]?
    var diameter:String?
    var rotation_period:String?
    var orbital_period:String?
    var gravity:String?
    var population:String?
    var climate:String?
    var terrain:String?
    var surface_water:String?
    var residents:[String]?
    var title:String?
    var episode_id:Int?
    var opening_crawl:String?
    var director:String?
    var producer:String?
    var release_date:String?
    var characters:[String]?
    var planets:[String]?
    var classification:String?
    var designation:String?
    var average_height:String?
    var average_lifespan:String?
    var people:[String]?
    var hyperdrive_rating:String?
    var MGLT:String?
    var starship_class:String?
    var eye_colors:String?
    var hair_colors:String?
    var skin_colors:String?
    var language:String?
    var url:String?
    var created:String?
    var edited:String?
    
    init?(json:String) {
        let session = URLSession.shared
        guard let url = URL(string: json) else {return}
        session.dataTask(with: url){
            (data,response,error) in
            guard let data = data else {return}
            do{
               
                print("JURL: " + json)
                if let person = try JSONDecoder().decode(Person?.self, from: data) {
                    self.name = person.name
                    self.birth_year = person.birth_year
                    self.eye_color = person.eye_color
                    self.gender = person.gender
                    self.hair_color = person.hair_color
                    self.height = person.height
                    self.mass = person.mass
                    self.skin_color = person.skin_color
                    self.homeworld = person.homeworld
                    self.films = person.films
                    self.species = person.species
                    self.starships = person.starships
                    self.vehicles = person.vehicles
                    self.url = person.url
                    self.created = person.created
                    self.edited = person.edited
                    print(person)
                }
               
            } catch let error {
                print("Couldnt create person Profile! \(error.localizedDescription )")

            }
            
            do {
                if let vehicle = try JSONDecoder().decode(Vehicle?.self, from: data) {
                    self.name = vehicle.name
                    self.model = vehicle.model
                    self.vehicle_class = vehicle.vehicle_class
                    self.manufacturer = vehicle.manufacturer
                    self.length = vehicle.length
                    self.cost_in_credits = vehicle.cost_in_credits
                    self.crew = vehicle.crew
                    self.passengers = vehicle.passengers
                    self.max_atmosphering_speed = vehicle.max_atmosphering_speed
                    self.cargo_capacity = vehicle.cargo_capacity
                    self.consumables = vehicle.consumables
                    self.films = vehicle.films
                    self.pilots = vehicle.pilots
                    self.url = vehicle.url
                    self.created = vehicle.created
                    self.edited = vehicle.edited
                    print(vehicle)
                }
            }catch let error {
                print("Couldnt create Vehicle Profile! \(error.localizedDescription )")
            }
            
            do {
                if let films = try JSONDecoder().decode(Film?.self, from: data) {
                    self.title = films.title
                    self.episode_id = films.episode_id
                    self.opening_crawl = films.opening_crawl
                    self.director = films.director
                    self.producer = films.producer
                    self.release_date = films.release_date
                    self.species = films.species
                    self.starships = films.starships
                    self.vehicles = films.vehicles
                    self.characters = films.characters
                    self.planets = films.planets
                    self.url = films.url
                    self.created = films.created
                    self.edited = films.edited
                }
            }catch let error {
                print("Couldnt create Films Profile! \(error.localizedDescription )")
            }
            do {
                if let starships = try JSONDecoder().decode(Starship?.self, from: data) {
                    self.name = starships.name
                    self.model = starships.model
                    self.starship_class = starships.starship_class
                    self.manufacturer = starships.manufacturer
                    self.cost_in_credits = starships.cost_in_credits
                    self.length = starships.length
                    self.crew = starships.crew
                    self.passengers = starships.passengers
                    self.max_atmosphering_speed = starships.max_atmosphering_speed
                    self.hyperdrive_rating = starships.hyperdrive_rating
                    self.MGLT = starships.MGLT
                    self.cargo_capacity = starships.cargo_capacity
                    self.consumables = starships.consumables
                    self.films = starships.films
                    self.pilots = starships.pilots
                    self.url = starships.url
                    self.created = starships.created
                    self.edited = starships.edited
                }
            }catch let error {
                print("Couldnt create startships Profile! \(error.localizedDescription )")
            }
            do {
                if let species = try JSONDecoder().decode(race?.self, from: data) {
                    self.name = species.name
                    self.classification = species.classification
                    self.designation = species.designation
                    self.average_height = species.average_height
                    self.average_lifespan = species.average_lifespan
                    self.eye_colors = species.eye_colors
                    self.hair_colors = species.hair_colors
                    self.skin_colors = species.skin_colors
                    self.language = species.language
                    self.homeworld = species.homeworld
                    self.people = species.people
                    self.films = species.films
                    self.url = species.url
                    self.created = species.created
                    self.edited = species.edited
                }
            }catch let error {
                print("Couldnt create species Profile! \(error.localizedDescription )")
            }
            do {
                if let planets = try JSONDecoder().decode(Planet?.self, from: data) {
                    self.name = planets.name
                    self.diameter = planets.diameter
                    self.rotation_period = planets.rotation_period
                    self.orbital_period = planets.orbital_period
                    self.gravity = planets.gravity
                    self.population = planets.population
                    self.climate = planets.climate
                    self.terrain = planets.terrain
                    self.surface_water = planets.surface_water
                    self.residents = planets.residents
                    self.films = planets.films
                    self.url = planets.url
                    self.created = planets.created
                    self.edited = planets.edited
                }
            }catch let error {
                print("Couldnt create species Profile! \(error.localizedDescription )")
            }
            Dispatch.shared.group.leave()
        }.resume()
    }
}


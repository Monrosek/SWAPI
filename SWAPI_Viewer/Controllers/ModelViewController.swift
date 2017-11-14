//
//  ModelViewController.swift
//  SWAPI_Viewer
//
//  Created by Mac on 11/6/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class ModelViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var back: UIBarButtonItem!
    var json:Model?
    var units:[Model] = []
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadData(jsonURL: json!.url)
        
    }
    
    private func downloadData(jsonURL:String) {
        let session = URLSession.shared
        // session.finishTasksAndInvalidate()
        guard let url = URL(string: jsonURL) else {return}
        session.dataTask(with: url){
            (data,response,error) in
            guard let data = data else {return}
            do{
                switch(self.json!.type) {
                case .people:
                    let jData = try JSONDecoder().decode(People.self, from: data)
                    for i in 0..<jData.results.count {
                        self.units.append(Model(name:jData.results[i].name, type:.people, url:jData.results[i].url )!)
                    }
                    if(jData.next ?? "" != "") {
                        self.downloadData(jsonURL: jData.next ?? "")
                    }
                    else {
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            // print(self.people.count)
                        }
                    }
                   // print(self.units.count)
                case .vehicles:
                    let jData = try JSONDecoder().decode(Vehicles.self, from: data)
                    for i in 0..<jData.results.count {
                        self.units.append(Model(name:jData.results[i].name, type:.vehicles, url:jData.results[i].url )!)
                    }
                    if(jData.next ?? "" != "") {
                        self.downloadData(jsonURL: jData.next ?? "")
                    }
                    else {
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                case .starships:
                    let jData = try JSONDecoder().decode(Starships.self, from: data)
                    for i in 0..<jData.results.count {
                        self.units.append(Model(name:jData.results[i].name, type:.starships, url:jData.results[i].url )!)
                    }
                    if(jData.next ?? "" != "") {
                        self.downloadData(jsonURL: jData.next ?? "")
                    }
                    else {
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                case .planets:
                    let jData = try JSONDecoder().decode(Planets.self, from: data)
                    for i in 0..<jData.results.count {
                        self.units.append(Model(name:jData.results[i].name, type:.planets, url:jData.results[i].url )!)
                    }
                    if(jData.next ?? "" != "") {
                        self.downloadData(jsonURL: jData.next ?? "")
                    }
                    else {
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                case .species:
                    let jData = try JSONDecoder().decode(Species.self, from: data)
                    for i in 0..<jData.results.count {
                        self.units.append(Model(name:jData.results[i].name, type:.species, url:jData.results[i].url )!)
                    }
                    if(jData.next ?? "" != "") {
                        self.downloadData(jsonURL: jData.next ?? "")
                    }
                    else {
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                case .films:
                    let jData = try JSONDecoder().decode(Films.self, from: data)
                    for i in 0..<jData.results.count {
                        self.units.append(Model(name:jData.results[i].title, type:.films, url:jData.results[i].url )!)
                    }
                    if(jData.next ?? "" != "") {
                        self.downloadData(jsonURL: jData.next ?? "")
                    }
                    else {
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                default: return
                }
            } catch let error {
                print("Couldnt download Vehicles batch! \(error.localizedDescription )")
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Return(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard let nc = segue.destination as? UINavigationController else {
            fatalError("didn't reach nav view controller")
        }
        
        guard let vc = nc.viewControllers.first as? DetailViewController else {
            fatalError("didn't reach detail view controller")
        }
        
        vc.json = units[index].url
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.performSegue(withIdentifier: "detail", sender: self)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

typealias ModelTableFunctions = ModelViewController
extension ModelTableFunctions: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // print("Number of Vehicles: \(vehicles?.results.count ?? 0)")
          //print(units.count)
        return  units.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as? tableCell else {
            fatalError("No tableCell in TableView")
        }
        
        var imgURL = (units[indexPath.row].name).components(separatedBy: " ").joined()
        imgURL = "https://raw.githubusercontent.com/kendellm/SWAPI/master/" + imgURL + ".png"
        
        cell.icon?.image = UIImage(named: "temp")
        cell.icon?.imageFrom(url: imgURL)
        cell.label?.text = units[indexPath.row].name
        return cell
    }
    
}

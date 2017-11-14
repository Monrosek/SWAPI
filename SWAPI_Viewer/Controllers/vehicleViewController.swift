//
//  PeopleViewController.swift
//  SWAPI_Viewer
//
//  Created by Mac on 11/4/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class vehicleViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var home: UIBarButtonItem!
    var json = String()
    var vehicles:[Vehicle?] = []
    var index = Int()
    
    
    func parseAssets(array:Vehicles?) {
        guard let count = array?.results.count else {
            fatalError("Nothing in vehicle results array")
        }
        for i in 0..<count {
            vehicles.append(array?.results[i])
        }
    }
    
    private func downloadData(json:String) {
        let session = URLSession.shared
        // session.finishTasksAndInvalidate()
        guard let url = URL(string: json) else {return}
        session.dataTask(with: url){
            (data,response,error) in
            guard let data = data else {return}
            do{
                let jData = try JSONDecoder().decode(Vehicles.self, from: data)
                self.parseAssets(array: jData)
                if(jData.next ?? "" != "") {
                    self.downloadData(json: jData.next ?? "")
                }
                else {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        // print(self.people.count)
                    }
                }
            } catch let error {
                print("Couldnt download Vehicles batch! \(error.localizedDescription )")
            }
            }.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //   print("Incoming URL: " + json)
        downloadData(json: json)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Return(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

typealias vehicleTable = vehicleViewController
extension vehicleTable : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // print("Number of Vehicles: \(vehicles?.results.count ?? 0)")
        //  print(people.count)
        return  vehicles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as? tableCell else {
            fatalError("No listCell in TableView")
        }
        
        
        var imgURL = (vehicles[indexPath.row]?.name ?? "").components(separatedBy: " ").joined()
        imgURL = "https://raw.githubusercontent.com/kendellm/SWAPI/master/" + imgURL + ".png"
        
        cell.icon?.image = UIImage(named: "temp")
        cell.icon?.imageFrom(url: imgURL)
        cell.label?.text = vehicles[indexPath.row]?.name ?? ""
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard let nc = segue.destination as? UINavigationController else {
            fatalError("didn't reach nav view controller")
        }
        
        guard let vc = nc.viewControllers.first as? DetailViewController else {
            fatalError("didn't reach detail view controller")
        }
        
        var tabs:[Tab?] = []
        tabs.append(Tab(name: "Name: ", url: vehicles[index]?.name ?? ""))
        tabs.append(Tab(name: "Model: ", url: vehicles[index]?.model ?? ""))
        tabs.append(Tab(name: "Vehicle Class: ", url: vehicles[index]?.vehicle_class ?? ""))
        tabs.append(Tab(name: "Manufacturer ", url: vehicles[index]?.manufacturer ?? ""))
        tabs.append(Tab(name: "Length: ", url: vehicles[index]?.length ?? ""))
        tabs.append(Tab(name: "Cost: ", url: vehicles[index]?.cost_in_credits ?? ""))
        tabs.append(Tab(name: "Crew: ", url: vehicles[index]?.crew ?? ""))
        tabs.append(Tab(name: "Passengers: ", url: vehicles[index]?.passengers ?? ""))
        tabs.append(Tab(name: "Max Atmosphering Speed: ", url: vehicles[index]?.max_atmosphering_speed ?? ""))
        tabs.append(Tab(name: "Films: ", url: vehicles[index]?.films.map{String($0 + ",")}.joined() ?? ""))
        tabs.append(Tab(name: "Pilots: ", url: vehicles[index]?.pilots.map{String($0 + ",")}.joined() ?? ""))
        //        tabs.append(Tab(name: "URL: ", url: people[index]?.name ?? ""))
        //        tabs.append(Tab(name: "Created: ", url: people[index]?.name ?? ""))
        //        tabs.append(Tab(name: "Name: ", url: people[index]?.name ?? ""))

   //     let imgURL = (vehicles[index]?.name ?? "").components(separatedBy: " ").joined()
   //     vc.imageUrl = "https://raw.githubusercontent.com/kendellm/SWAPI/master/" + imgURL + ".png"
    //    vc.data = tabs
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.performSegue(withIdentifier: "detail", sender: self)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}


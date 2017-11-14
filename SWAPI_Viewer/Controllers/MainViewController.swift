//
//  MainViewController.swift
//  SWAPI_Viewer
//
//  Created by Mac on 11/4/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var tabs:[Model?] = []
    var index = Int()
 
    
    @IBOutlet var tableView: UITableView!
    
    func parseAssets(obj:Categories?) {
        tabs.append(Model(type: .people, url: obj?.people ?? ""))
        tabs.append(Model(type: .films, url: obj?.films ?? ""))
        tabs.append(Model(type: .vehicles, url: obj?.vehicles ?? ""))
        tabs.append(Model(type: .starships, url: obj?.starships ?? ""))
        tabs.append(Model(type: .planets, url: obj?.planets ?? ""))
        tabs.append(Model(type: .species, url: obj?.species ?? ""))
    }
    
    private func downloadData(json:String) {
        let session = URLSession.shared
        guard let url = URL(string: json) else {return}
        session.dataTask(with: url){
            (data,response,error) in
            guard let data = data else {return}
            do{
                let tData = try JSONDecoder().decode(Categories.self, from: data)
               // print(tData)
                self.parseAssets(obj: tData)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print("Couldnt Create list of Categories! \(error.localizedDescription )")
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData(json: "https://swapi.co/api/")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation
    @IBAction func unwindToMain(sender: UIStoryboardSegue) {
       // if let sourceViewController = sender.source as? addBookViewController, let book = sourceViewController.book {
        //}
    }
            

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                // Get the new view controller using segue.destinationViewController.
                // Pass the selected object to the new view controller.
                guard let nc = segue.destination as? UINavigationController else {
                    fatalError("didn't reach nav view controller")
                }
                guard let vc = nc.viewControllers.first as? ModelViewController else {
                    fatalError("didn't reach people view controller")
                }
                vc.json = tabs[index]
    }
    
}//end VC

typealias TableViewFunctions = MainViewController
extension TableViewFunctions : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  tabs.count
    }
    
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            fatalError("No Cell in TableView")
        }
    
        index = indexPath.row
        cell.textLabel?.text = tabs[indexPath.row]?.name ?? ""
        return cell
    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.index = indexPath.row
      //  print(tabs[index]?.name ?? "")
        self.performSegue(withIdentifier: "model", sender: self)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

//
//  PeopleViewController.swift
//  SWAPI_Viewer
//
//  Created by Mac on 11/4/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {

    @IBOutlet var home: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    var json = String()
    var people:[Person?] = []
    var index = Int()

    
    func parseAssets(array:People?) {
        guard let count = array?.results.count else {
            fatalError("Nothing in vehicle results array")
        }
        for i in 0..<count {
            people.append(array?.results[i])
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
                let jData = try JSONDecoder().decode(People.self, from: data)
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

typealias peopleTable = PeopleViewController
extension peopleTable : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // print("Number of Vehicles: \(vehicles?.results.count ?? 0)")
      //  print(people.count)
        return  people.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as? tableCell else {
            fatalError("No tableCell in TableView")
    }
    
        
        var imgURL = (people[indexPath.row]?.name ?? "").components(separatedBy: " ").joined()
        imgURL = "https://raw.githubusercontent.com/kendellm/SWAPI/master/" + imgURL + ".png"
        
        cell.icon?.image = UIImage(named: "temp")
        cell.icon?.imageFrom(url: imgURL)
        cell.label?.text = people[indexPath.row]?.name ?? ""
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
        
            vc.json = (people[index]?.url)!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.performSegue(withIdentifier: "detail", sender: self)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

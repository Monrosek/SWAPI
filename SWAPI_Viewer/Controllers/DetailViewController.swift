//  DetailViewController.swift
//  SWAPI_Viewer
// Kendell Monrose
//  Created by Mac on 11/4/17.
//  Copyright © 2017 Mobile Apps Company. All rights reserved.
//
import UIKit
class DetailViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var back: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    var json = String()
    var viewModel:DetailViewModel?
    var segueUrl = String()
    
    var profile:Profile?
  //  var viewModel = DetailViewModel(url: "help")

    override func viewDidLoad() {
        super.viewDidLoad()
        
       Dispatch.shared.group.enter()
            profile = Profile(json: self.json)
            Dispatch.shared.group.notify(queue: DispatchQueue.main){
                Dispatch.shared.group.enter()
                self.viewModel = DetailViewModel(profile: self.profile!)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }

        Dispatch.shared.group.notify(queue: DispatchQueue.main) {
            self.tableView.dataSource = self.viewModel
            self.tableView.delegate = self
            self.tableView.estimatedRowHeight = 100
            self.tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.register(labelCell.nib, forCellReuseIdentifier: labelCell.identifier)
            self.tableView.register(listCell.nib, forCellReuseIdentifier: listCell.identifier)
            self.tableView.register(imageCell.nib, forCellReuseIdentifier: imageCell.identifier)
            self.tableView.sectionIndexColor = UIColor.gray
            self.tableView.sectionIndexBackgroundColor = UIColor.black
           // self.tableView.
        }
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Return(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nc = segue.destination as? UINavigationController else {
            fatalError("didn't reach nav view controller")
        }
        guard let vc = nc.viewControllers.first as? DetailViewController else {
            fatalError("didn't reach detail view controller")
        }
        
        vc.json = segueUrl
        print(vc.json)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel?.items[indexPath.section]
        if let item = item as? listDetailItem {
            segueUrl = item.list[indexPath.row].label
            self.performSegue(withIdentifier: "detail", sender: self)
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
 
}


extension DetailViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       // print(items.count)
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  print(items[section].rowCount)
        return items[section].rowCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let item = items[indexPath.section]
        switch item.type {
        case .label:
            if let cell = tableView.dequeueReusableCell(withIdentifier: labelCell.identifier, for: indexPath) as? labelCell {
                cell.item = item
                return cell
            }
        case .list:
            if let item = item as? listDetailItem, let cell = tableView.dequeueReusableCell(withIdentifier: listCell.identifier, for: indexPath) as? listCell {
               // cell.label.text = item.list[indexPath.row].getName()
//                let url = item.list[indexPath.row].url
//                //var name = String()
//                Dispatch.shared.group.enter()
//                let profile = Profile(json: url)
//                let name = profile?.name ?? ""
//
                    var url = item.list[indexPath.row].url
                    item.list[indexPath.row].nameFrom(url: url)
                    cell.item = item.list[indexPath.row]
//                }
//                print("Vehicle Cell Name: " + name)

                return cell
            }
        case .image:
            if let cell = tableView.dequeueReusableCell(withIdentifier: imageCell.identifier, for: indexPath) as? imageCell {
                cell.item = item
                return cell
            }
        default:
            return cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
        
    }
 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightGray
        
        let headerLabel = UILabel(frame: CGRect(x: 30, y: 0, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.font = UIFont(name: "Star Jedi Outline", size: 20)
        headerLabel.textColor = UIColor.magenta
        headerLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
}



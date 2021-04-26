//
//  ViewController.swift
//  ShowTime
//
//  Created by Harsh Verma on 26/04/21.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var shows = Shows()
    var searchText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        shows.urlString += searchText
        // Do any additional setup after loading the view.
        shows.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! DetailVC
        let selectIndex = tableView.indexPathForSelectedRow!
        dest.show = shows.showArray[selectIndex.row].show
    }
    
    @IBAction func segmentCtrl(_ sender: UISegmentedControl) {
        
        
    }
    
}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.showArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = shows.showArray[indexPath.row].show.name
        if let r = shows.showArray[indexPath.row].show.rating?.average {
            cell.detailTextLabel?.text = "\(r)"
        }else {
            cell.detailTextLabel?.text = "-"
        }
        return cell
    }
   
    
}

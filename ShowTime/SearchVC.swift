//
//  SearchVC.swift
//  ShowTime
//
//  Created by Harsh Verma on 26/04/21.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchShowLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTxtField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var searchText = searchTxtField.text!
        searchText = searchText.replacingOccurrences(of: " ", with: "%20")
        let destination = segue.destination as! ListVC
        destination.searchText = searchText
    }

}

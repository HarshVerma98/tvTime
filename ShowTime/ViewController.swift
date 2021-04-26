//
//  ViewController.swift
//  ShowTime
//
//  Created by Harsh Verma on 26/04/21.
//

import UIKit

class ViewController: UIViewController {

    var shows = Shows()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shows.getData {
            print("Called")
        }
    }


}


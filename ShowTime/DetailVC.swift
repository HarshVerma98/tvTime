//
//  DetailVC.swift
//  ShowTime
//
//  Created by Harsh Verma on 26/04/21.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var networkLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    var show: Show!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard show != nil else {
            print("Should Not Happen")
            return
        }
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    
    func updateUI() {
        nameLabel.text = show.name
        languageLabel.text = show.language ?? ""
        networkLabel.text = show.network?.name ?? ""
        show.summary = show.summary?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        if let rating = show.rating?.average {
            ratingLabel.text = "\(rating)"
        }else {
            ratingLabel.text = "-"
        }
        descriptionText.text = show.summary ?? ""
        var genreList = ""
        if show.genres != nil {
            for genre in show.genres! {
                genreList += "\(genre)\n"
            }
            if genreList != "" {
                genreList.removeLast()
            }
        }
        genreLabel.text = genreList
        guard let url = URL(string: show.image?.original ?? "") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            imageView.image = UIImage(data: data)
        }catch {
            print("Image Capturing Failed")
        }
    }
}

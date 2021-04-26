//
//  SearchVC.swift
//  ShowTime
//
//  Created by Harsh Verma on 26/04/21.
//

import UIKit
import AVFoundation
class SearchVC: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
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
        imageView.alpha = 0.0
        searchShowLabel.alpha = 0.0
        searchTxtField.alpha = 0.0
        searchButton.alpha = 0.0
        playSound(name: "tv-startup-sound")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 5, animations: {
            self.imageView.alpha = 1.0
        })
        
        UIView.animate(withDuration: 1.0, delay: 4.0, animations: {
            self.searchTxtField.alpha = 1.0
            self.searchButton.alpha = 1.0
            self.searchShowLabel.alpha = 1.0
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var searchText = searchTxtField.text!
        searchText = searchText.replacingOccurrences(of: " ", with: "%20")
        let destination = segue.destination as! ListVC
        destination.searchText = searchText
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                audioPlayer = try! AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }catch {
                print("Error Playing Sound")
            }
        }else {
            print("Failed to load asset")
        }
    }

}

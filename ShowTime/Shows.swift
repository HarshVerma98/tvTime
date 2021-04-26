//
//  Shows.swift
//  ShowTime
//
//  Created by Harsh Verma on 26/04/21.
//

import Foundation
class Shows {
    
    struct Returned: Codable {
        //var score: Double
        var show: Show
    }
    
    struct Show: Codable {
        var name: String
        var language: String?
        var summary: String?
        var genres: [String]?
        var rating: Rating?
        var network: Network?
        var image: Image?
    }
    
    struct Rating: Codable {
        var average: Double?
    }
    
    struct Network: Codable {
        var name: String?
    }
    
    struct Image: Codable {
        var original: String?
    }
    
    var urlString = "https://api.tvmaze.com/search/shows?q=alien"
    var showArray: [Returned] = []
    //MARK:- Download Function for Api
    
    func getData(completed: @escaping() -> ()) {
        print("Now Accessing the url:- \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("Error could not create a url from:- \(urlString)")
            completed()
            return
        }
        
        //URL Session Creation
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let er = error {
                print("Error creation task:- \(er.localizedDescription)")
            }
            do {
                self.showArray = try JSONDecoder().decode([Returned].self, from: data!)
                print("Parsed Result is :- \(self.showArray)")
            }catch {
                print("JSON Decoding Error:- \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
    
}

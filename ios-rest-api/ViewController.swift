//
//  ViewController.swift
//  ios-rest-api
//
//  Created by Brian Bansenauer on 9/25/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

let DomainURL = "https://mockend.com/MikeTheGreat/ios-rest-api-placeholder-data/"

class User : Codable {
    
    let id : Int?
    let firstName : String?
    let lastName : String?
    let age : Int?
    
    enum CodingKeys : String, CodingKey {
        case id
        case firstName = "FirstName"
        case lastName = "LastName"
        case age = "Age"
    }
    
    static func fetch(){
        let URLstring = DomainURL + "users"
        
        if let url = URL.init(string: URLstring){
            let task = URLSession.shared.dataTask(with: url, completionHandler:
            //TODO: Add closure
            {(data, response, error) in
                print(String(data: data!, encoding: .ascii) ?? "no data")
            })
            task.resume()
        }
    }
    
    static func fetch(withID id:Int){
        let URLstring = DomainURL + "users/\(id)"
        if let url = URL.init(string: URLstring){
            let task = URLSession.shared.dataTask(with: url, completionHandler:
            //TODO: Add closure
                {(data, response, error) in
                print(String.init(data: data!, encoding: .ascii) ?? "no data")
                if let newUser = try? JSONDecoder().decode(User.self, from: data!){
                    print(newUser.lastName ?? "no last name")
                }
            })
            task.resume()
        }
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        User.fetch(withID: 1)
    }
    
}


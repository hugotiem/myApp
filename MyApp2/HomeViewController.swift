//
//  ViewController.swift
//  MyApp2
//
//  Created by Thomas RIVIERE on 04/03/2022.
//

import UIKit
import MyFood

class HomeViewController: UIViewController {
    
    var search: Search = Search.getInstance()
    var restaurants: [MyFood.Restaurant]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        search.fetchRestaurant(search: "mcdo") { res, err in
            self.restaurants = res
            if self.restaurants != nil {
                for r in self.restaurants! {
                    print(r.getName())
                }
            }
        }
    }


}


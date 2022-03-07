//
//  DetailRestaurantViewController.swift
//  MyApp2
//
//  Created by Benjamin GOGO on 05/03/2022.
//

import Foundation
import UIKit
import CoreLocation


class DetailRestaurantViewController: UIViewController {
 
    @IBOutlet weak var restaurantName: UILabel!
    var restaurant : Restaurant!
    
    override func viewDidLoad() {
        restaurantName.text = self.restaurant.name
    }
    
    @IBAction func touchButton(_ sender: Any) {
        //print("go go go")
        /*let storyBoard = UIStoryboard(name: "Map", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "mapID") as! MapViewController
        
        self.present(controller, animated: true, completion: nil)*/
        
        
        let story = UIStoryboard(name : "Map", bundle: nil)
        let controller = story.instantiateViewController(identifier: "mapID") as! MapViewController
        controller.restaurant = restaurant
        let navigation = UINavigationController(rootViewController: controller)
        self.view.addSubview(navigation.view)
        self.addChild(navigation)
        navigation.didMove(toParent: self)
    }
}

//
//  SearchViewController.swift
//  MyApp2
//
//  Created by Benjamin GOGO on 05/03/2022.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    var restaurants = [String]()
    
    func initListRestaurant(){
        restaurants.append("vapiano")
        restaurants.append("mcdo")
        restaurants.append("grec du coin")
        restaurants.append("beefcut")
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initListRestaurant()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

    extension SearchViewController : UITableViewDelegate{
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            print("test")
        }
        
    }
    
    extension SearchViewController : UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return restaurants.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TableViewCell
            
            cell.restaurantName?.text = restaurants[indexPath.row] 
        
            return cell
        }
    }
    


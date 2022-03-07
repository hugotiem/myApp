//
//  SearchViewController.swift
//  MyApp2
//
//  Created by Benjamin GOGO on 05/03/2022.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate{
    
    
    var restaurants = [Restaurant]()
    var filteredRestaurants = [Restaurant]()

    func initListRestaurant(){
        restaurants.append(Restaurant(id: "1", name: "Vapiano", address: "11 Boulevard des Champs, 78000 Versailles", tags: ["Japonais"],coordonnes: Coordinate(latitude: 51.507222, longitude: -0.1275)))

        restaurants.append(Restaurant(id: "2", name: "Beefcut", address: "9 Rue Magenta, 75012 Paris", tags: ["Japonais"],coordonnes: Coordinate(latitude: 48.780810,longitude:2.016275)))
                                        
        restaurants.append(Restaurant(id: "3", name: "GLADALLE", address: "11 Boulevard des Champs, 78000 Versailles", tags: ["Japonais"],coordonnes: Coordinate(latitude: 48.8441255,longitude:2.3041047)))
                           
        restaurants.append(Restaurant(id: "4", name: "FoodiCal", address: "1 champ des loouvier, 78150 Chesnay", tags: ["Japonais"],coordonnes: Coordinate(latitude: 48.8495701,longitude:2.3858157)))
    }
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredRestaurants = []
        
        if searchText == "" {
            filteredRestaurants = restaurants
        }else{
            for restaurant in restaurants {
                if restaurant.name.lowercased().contains(searchText.lowercased()) {
                    filteredRestaurants.append(restaurant)
                }
            }
        }
        
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initListRestaurant()
        filteredRestaurants = restaurants
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
   
        return true
    }
    

    



    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //print("select row")
    
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "detailRestaurant") as! DetailRestaurantViewController

        controller.restaurant = filteredRestaurants[indexPath.row]
        
        self.present(controller, animated: true, completion: nil)

    }
    
 



    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRestaurants.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TableViewCell
        
        cell.restaurantName?.text = filteredRestaurants[indexPath.row].name
    
        return cell
    }

}
    



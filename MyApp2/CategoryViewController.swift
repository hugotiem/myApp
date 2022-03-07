//
//  CategoryViewController.swift
//  MyApp2
//
//  Created by Thomas RIVIERE on 04/03/2022.
//

import UIKit

class CategoryViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var typeRestaurantModels : [String] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        typeRestaurantModels.append("Japonais")
        typeRestaurantModels.append("Italien")
        typeRestaurantModels.append("Africain")
        typeRestaurantModels.append("Reste")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return typeRestaurantModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CollectionViewCell
        
        cell.typeRestaurant.text = typeRestaurantModels[indexPath.row]
        cell.backgroundColor = .blue
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         // handle tap events
         print("You selected cell #\(indexPath.item)!")
     }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

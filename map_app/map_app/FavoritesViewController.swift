//
//  FavoritesViewController.swift
//  map_app
//
//  Created by Allison Collins on 2/12/20.
//  Copyright © 2020 Allison Collins. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    weak var delegate: PlacesFavoritesDelegate?
    @IBOutlet var favoritesTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let list = defaults.object(forKey: "favePlaces") as? [String] ?? [String]()
        if list.count == 0 {
            return 1
        }
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = defaults.object(forKey: "favePlaces") as? [String] ?? [String]()
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        
        //Prevent crash if no favorites have been added
        if list.count == 0 {
            cell?.textLabel!.text = "No favorites yet!"
            return cell!
        }
        
        let place = list[indexPath.row]
        cell?.textLabel!.text = place
        return cell!
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTable.delegate = self
        favoritesTable.dataSource = self
        self.favoritesTable.reloadData()
    }
    
    @IBAction func goBack(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let currName = cell?.textLabel?.text
        delegate?.favoritePlace(name: currName!)
        dismiss(animated: true, completion: nil)
    }

}

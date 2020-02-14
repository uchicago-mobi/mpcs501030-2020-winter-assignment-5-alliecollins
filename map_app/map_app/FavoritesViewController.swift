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
        let place = list[indexPath.row]
        cell?.textLabel!.text = place
        
        return cell!
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTable.delegate = self
        favoritesTable.dataSource = self
        print(defaults.object(forKey: "favePlaces") as! [String])
        self.favoritesTable.reloadData()
    }
    
    @IBAction func goBack(_ sender: Any) {
        performSegue(withIdentifier: "returnSegue", sender: self)
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

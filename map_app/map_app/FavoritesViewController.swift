//
//  FavoritesViewController.swift
//  map_app
//
//  Created by Allison Collins on 2/12/20.
//  Copyright © 2020 Allison Collins. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "myCell"){
            if let label = cell.textLabel {
                label.text = "test"
            }
            return cell
        }
        return UITableViewCell()
    }
    
    @IBOutlet var favoritesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

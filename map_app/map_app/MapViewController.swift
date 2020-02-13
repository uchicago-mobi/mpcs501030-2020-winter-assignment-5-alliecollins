//
//  MapViewController.swift
//  map_app
//
//  Created by Allison Collins on 2/11/20.
//  Copyright © 2020 Allison Collins. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var favoritesButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        let miles: Double = 20 * 1600
        let center = CLLocationCoordinate2DMake(41.8789, -87.6359)
        let viewRegion = MKCoordinateRegion(center: center, latitudinalMeters: miles, longitudinalMeters: miles)
        mapView.setRegion(viewRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsCompass = false
        mapView.pointOfInterestFilter = .excludingAll
        self.favoritesButton.backgroundColor = UIColor.systemGray
        
        struct ListData : Codable {
            var places : [aPlace]?
        }

        struct aPlace: Codable {
            var name: String
            var description: String
            var lat: Double
            var long: Double
            var type: Int
        }
        
        var tempList: ListData?
        
        if let path = Bundle.main.path(forResource:"Data", ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path),
            let tempList = try? PropertyListDecoder().decode(ListData.self, from: xml){
            print(tempList)
        }
//            let xml = FileManager.default.contents(atPath: path),
//            let tempPlace = try? PropertyListDecoder().decode(MyPlace.self, from: xml) {
//            print(tempPlace.name)
//        }
////        if let data = try? FileManager.default.contents(atPath: path) {
////            let decoder = PropertyListDecoder()
////            tempPlace = try? decoder.decode(MyPlace.self, from: data)
////            print(tempPlace)
////        }
//
//        let data = FileManager.default.contents(atPath: path)
//        let tempPlace = try? PropertyListDecoder().decode(MyPlace.self, from: data)
//        favePlaces.append(tempPlace)
//        print(favePlaces)
//
//        else{
//
//        }

        // Do any additional setup after loading the view.
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

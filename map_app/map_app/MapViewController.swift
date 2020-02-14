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
    @IBOutlet var mapView: MKMapView! {
        didSet { mapView.delegate = self }
    }
    @IBOutlet var pointDescription: pointView!
    @IBOutlet var favoritesButton: UIButton!
    var myAnnotations = [Place]()
    
    @IBAction func newFave(_ sender: UIButton) {
        let name = self.pointDescription.placeLabel.text!
        DataManager.sharedInstance.saveFavorites(name: name)
        sender.isSelected = true
    }
    @IBAction func switchView(_ sender: Any) {
        performSegue(withIdentifier: "mySegue", sender: self)
    }
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
        
        //initialize empty labels
        self.pointDescription.placeDescription.text = "When you select a location, info will appear!"
        self.pointDescription.placeLabel.text = "Pick a place!"
        
        let locations = DataManager.sharedInstance.loadAnnotationFromPlist()
        for location in locations {
            let newPlace = Place()
            newPlace.name = location.name
            newPlace.longDescription = location.description
            let coord = CLLocationCoordinate2D(latitude: location.lat, longitude: location.long)
            newPlace.coordinate = coord
            mapView.addAnnotation(newPlace)
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
}
extension MapViewController: MKMapViewDelegate {

func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    var newPlace = Place()
    newPlace = view.annotation as! Place
    self.pointDescription.placeDescription.text = newPlace.longDescription
    self.pointDescription.placeLabel.text = newPlace.name
    
}
}

protocol PlacesFavoritesDelegate: class {
    func favoritePlace(name: String) -> Void
}

extension MapViewController: PlacesFavoritesDelegate {
    func favoritePlace(name: String){
    //update the location
    }
}

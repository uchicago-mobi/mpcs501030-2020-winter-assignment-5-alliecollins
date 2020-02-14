//
//  PlaceMarkerView.swift
//  map_app
//
//  Created by Allison Collins on 2/11/20.
//  Copyright © 2020 Allison Collins. All rights reserved.
//

import UIKit
import MapKit

class PlaceMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            clusteringIdentifier = "Place"
            displayPriority = .defaultLow
            markerTintColor = .systemRed
            glyphImage = UIImage(systemName: "pin.fill")
        }
    }

}

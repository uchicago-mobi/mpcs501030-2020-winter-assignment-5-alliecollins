//
//  DataManager.swift
//  map_app
//
//  Created by Allison Collins on 2/12/20.
//  Copyright © 2020 Allison Collins. All rights reserved.
//

import Foundation
import MapKit
let defaults = UserDefaults.standard

public class DataManager {
    //Mark: - Singleton Stuff
    public static let sharedInstance = DataManager()
    
    //this prevents others from using the default '()'
    fileprivate init() {
        self.loadAnnotationFromPlist()
    }
    
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
    
    //Functions
    func loadAnnotationFromPlist() -> [aPlace] {
        //citation for help with nesting: https://stackoverflow.com/questions/49186333/iterating-through-plist-file-and-storing-data-in-array-or-dictionary

        
        var tempList: ListData?
        
        if let path = Bundle.main.path(forResource:"Data", ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path),
            let tempList = try? PropertyListDecoder().decode(ListData.self, from: xml){
            return tempList.places!
        }
        return tempList!.places!
    }
}

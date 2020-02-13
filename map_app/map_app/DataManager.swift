//
//  DataManager.swift
//  map_app
//
//  Created by Allison Collins on 2/12/20.
//  Copyright © 2020 Allison Collins. All rights reserved.
//

import Foundation

public class DataManager {
    //Mark: - Singleton Stuff
    public static let sharedInstance = DataManager()
    
    //this prevents others from using the default '()'
    fileprivate init() {}
    
    //Functions
    func loadAnnotationFromPlist() {
    
        let path: String = Bundle.main.path(forResource:"Data", ofType: "plist")!
        
        struct MyPlaces: Codable {
          var name: String
          var longDescription: Int
        }
        
        var favePlaces: [MyPlaces]! = []
        
        var tempPlace: MyPlaces?
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
          let decoder = PropertyListDecoder()
          tempPlace = try? decoder.decode(MyPlaces.self, from: data)
            favePlaces.append(tempPlace!)
        }
        
//    var settings: MySettings?
//
//    if let data = try? Data(contentsOf: settingsURL) {
//      let decoder = PropertyListDecoder()
//      settings = try? decoder.decode(MySettings.self, from: data)
    }
    
    //func saveFavorites()
    //func
//}
        
}

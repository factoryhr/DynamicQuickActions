//
//  JSONService.swift
//  DynamicQuickActions
//
//  Created by Ivan Kovacevic on 27/04/2017.
//  Copyright © 2017 Ivan Kovacevic. All rights reserved.
//

import UIKit

typealias JSON = [String: Any]

struct JSONService {

    static func loadJSON() -> [JSON]? {
        
        guard
            let path = Bundle.main.path(forResource: "animals", ofType: "json") else {
                print("There's no file at given path.")
                return nil
        }
        
        do {
            
            let url = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: url, options: .dataReadingMapped)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [JSON]
            return json
            
        } catch(let error) {
            print("error reading data: \(error)")
        }
        
        return nil
    }
    
    static func loadAnimals() -> [Animal] {
    
        guard let animalsJOSN = JSONService.loadJSON() else {
            // do a error managment here
            return []
        }
        
        // map over json with our model
        return animalsJOSN.flatMap { Animal(json: $0) }
    }
}

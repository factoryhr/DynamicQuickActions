//
//  Animal.swift
//  DynamicQuickActions
//
//  Created by Ivan Kovacevic on 27/04/2017.
//  Copyright © 2017 Ivan Kovacevic. All rights reserved.
//

struct Animal {

    let id: Int
    let name: String
    let description: String
    let imageName: String
}

extension Animal {
    
    init?(json: JSON) {
        
        guard
            let id = json["id"] as? Int,
            let name = json["name"] as? String,
            let description = json["description"] as? String,
            let image = json["image"] as? String else {
                print("Error parsing json: \(json)")
                return nil
        }
        
        self.id = id
        self.name = name
        self.description = description
        self.imageName = image
    }
}

//
//  QuickActionsService.swift
//  DynamicQuickActions
//
//  Created by Ivan Kovacevic on 27/04/2017.
//  Copyright © 2017 Ivan Kovacevic. All rights reserved.
//

import UIKit

struct QuickActionsService {

    static let defaultTypePrefix = "com.yourAppID.quickAction."
    
    // create list of dynamic shortcut items based on api response
    static func registerAnimalsToQuickActions(animals: [Animal]) {
        
        UIApplication.shared.shortcutItems = animals.map { animal -> UIApplicationShortcutItem in
            let type = QuickActionsService.defaultTypePrefix + "\(animal.id)"
            return UIApplicationShortcutItem(type: type, localizedTitle: animal.name, localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .favorite), userInfo: nil)
        }
    }
    
    static func performActionFor(shortcutItem: UIApplicationShortcutItem, for root: ViewController) {

        if shortcutItem.type.contains(QuickActionsService.defaultTypePrefix) {
            guard let idString = shortcutItem.type.components(separatedBy: ".").last, let id = Int(idString) else { return }
            
            // now get original array from when we registered our quick actions and send it to the root controller class
            let animal = JSONService.loadAnimals().first(where: { $0.id == id })
            root.selectedAnimal = animal
        }
    }
}

//
//  AppDelegate.swift
//  DynamicQuickActions
//
//  Created by Ivan Kovacevic on 27/04/2017.
//  Copyright © 2017 Ivan Kovacevic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        // get reference to the top view controller, in this case this is the `ViewController` class, and int this case it is safe to force unwrap because it is the only controller in our app
        let root = self.window?.rootViewController as! ViewController
        QuickActionsService.performActionFor(shortcutItem: shortcutItem, for: root)
    }
}

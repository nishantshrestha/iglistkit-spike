//
//  AppDelegate.swift
//  IGListKit-Spike
//
//  Created by Nishant Shrestha on 4/4/18.
//  Copyright © 2018 Nishant Shrestha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: HomeFeedViewController())
        window?.makeKeyAndVisible()
        
        UICollectionView.appearance().backgroundColor = .white
        
        return true
    }

}


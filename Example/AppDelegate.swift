//
//  AppDelegate.swift
//  Example
//
//  Created by Emre Cakirlar on 29.08.18.
//  Copyright © 2018 KI labs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = ViewController()
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        return true
    }

}


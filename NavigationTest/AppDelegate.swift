//
//  AppDelegate.swift
//  NavigationTest
//
//  Created by Tamás Csató on 2019. 06. 30..
//  Copyright © 2019. The Analyst Research LLP. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        keyWindow().rootViewController = ExampleRouter().startNavigation()

        return true
    }

    private func keyWindow() -> UIWindow {
        guard let window = UIApplication.shared.keyWindow else {
            let delegate = UIApplication.shared.delegate as! AppDelegate // swiftlint:disable:this force_cast
            delegate.window = UIWindow(frame: UIScreen.main.bounds)
            delegate.window?.makeKeyAndVisible()
            return delegate.window!
        }
        
        return window
    }

}


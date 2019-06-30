//
//  Router.swift
//  NavigationTest
//
//  Created by Tamás Csató on 2019. 06. 30..
//  Copyright © 2019. The Analyst Research LLP. All rights reserved.
//

import UIKit

enum NavigationType {
    case push
    case present
}

protocol TargetProtocol {
    associatedtype Router: RouterProtocol
    
    func urlComponent() -> String
    func viewController(router: Router) -> UIViewController
    func navigationType() -> NavigationType
}

protocol RouterProtocol {
    associatedtype Target: TargetProtocol
    
    func startNavigation() -> UIViewController
    func navigateToTarget(target: Target)
    func performNavigationWithUrl(url: URL)
    func canResolveUrl(url: URL)
}

protocol NavigationControllerRouter: RouterProtocol {
    var rootController: UINavigationController! { get }
}

protocol TabControllerRouter: RouterProtocol {
    var rootController: UITabBarController! { get }
}

//
//  ExampleRouter.swift
//  NavigationTest
//
//  Created by Tamás Csató on 2019. 06. 30..
//  Copyright © 2019. The Analyst Research LLP. All rights reserved.
//

import UIKit

class ExampleRouter: NavigationControllerRouter {
    enum Target: TargetProtocol {
        
        typealias Router = ExampleRouter
        
        case start
        case second
        case third
        
        func urlComponent() -> String {
            // Return enum case specific component here
            return ""
        }
        
        func viewController(router: ExampleRouter) -> UIViewController {
            let viewController = UIViewController()
            // Instantiate specific viewcontroller here with factory, pass router
            return viewController
        }
        
        func navigationType() -> NavigationType {
            // Return enum case specific navigation type in flow here
            return .push
        }
    }
    
    public private(set) var rootController: UINavigationController!
    
    func startNavigation() -> UIViewController {
        self.rootController = UINavigationController()
        self.rootController!.pushViewController(Target.start.viewController(router: self), animated: true)
        return self.rootController!
    }
    
    func navigateToTarget(target: ExampleRouter.Target) {
        switch target.navigationType() {
        case .present:
            self.rootController?.present(target.viewController(router: self), animated: true, completion: nil)
        case .push:
            self.rootController?.pushViewController(target.viewController(router: self), animated: true)
        }
    }
    
    func performNavigationWithUrl(url: URL) {
        // Create viewControllers based on url components, perform sequential navigation
    }
    
    func canResolveUrl(url: URL) {
        // Check if path components are contained in target
    }
}

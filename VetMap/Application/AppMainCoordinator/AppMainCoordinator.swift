//
//  AppMainCoordinator.swift
//  VetMap
//
//  Created by user on 20.09.2023.
//

import UIKit

class AppMainCoordinator: Coordinator {
    
    private let window: UIWindow
    private let dependencyContainer: AppDependencyContainer
    
    init(window: UIWindow?, container: AppDependencyContainer) {
        guard let window else {
            fatalError("There is no window for AppCoordinator")
        }
        
        self.window = window
        self.dependencyContainer = container
    }
    
    override func start() {
        window.makeKeyAndVisible()
        
//        UserDefaults.standard.set("false", forKey: "isAuth")
//        let isAuthenticated = UserDefaults.standard.bool(forKey: "isAuth")
//
//        if isAuthenticated {
            openMainTabBar()
//        } else {
//            openAuthView()
//        }
    }
    
    
    func openMainTabBar(with data: String? = nil ) {
        let tabBarCoordinator = MainTabBarController(dependencyContainer: dependencyContainer, authData: data)
        changeRootViewController(tabBarCoordinator)
    }
    
    func openAuthView() {
        let coordinator = AuthViewCoordinator(navigationController: UINavigationController(), dependencyContainer: dependencyContainer, parentCoordinator: self)
        coordinator.start()
        window.rootViewController = coordinator.navigationController
    }
    
    
    private func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        window.rootViewController = vc
        
        UIView.transition(with: window,
                          duration: 0.5,
                          options: [.transitionFlipFromLeft],
                          animations: nil,
                          completion: nil)
    }
    
}

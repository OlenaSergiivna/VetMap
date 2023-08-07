//
//  MainTabBarController.swift
//  VetMap
//
//  Created by user on 03.07.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let vetsCoordinator = VetsViewCoordinator(navigationController: UINavigationController())
    let appointmentsCoordinator = AppointmentsViewCoordinator(navigationController: UINavigationController())
    let tipsCoordinator = TipsViewCoordinator(navigationController: UINavigationController())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarAppearance()
        
        vetsCoordinator.start()
        appointmentsCoordinator.start()
        tipsCoordinator.start()
        
        let vetsNav = vetsCoordinator.navigationController
        let appointmentsNav = appointmentsCoordinator.navigationController
        let tipsNav = tipsCoordinator.navigationController
        
        viewControllers = [vetsNav, appointmentsNav, tipsNav]
        
    }
    
    func setupTabBarAppearance() {

        tabBar.layer.cornerRadius = 40
        tabBar.layer.masksToBounds = true
        
        tabBar.backgroundColor = .white.withAlphaComponent(0.9)
        tabBar.tintColor = .systemTeal
        tabBar.unselectedItemTintColor = .systemGray
        
    }
}

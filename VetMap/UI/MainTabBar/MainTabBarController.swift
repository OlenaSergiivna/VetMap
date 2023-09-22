//
//  MainTabBarController.swift
//  VetMap
//
//  Created by user on 03.07.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    var dependencyContainer: AppDependencyContainer
    
    var authData: String?
    
    init(dependencyContainer: AppDependencyContainer, authData: String? = nil) {
        self.dependencyContainer = dependencyContainer
        self.authData = authData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarAppearance()
        
        let vetsCoordinator = VetsViewCoordinator(navigationController: UINavigationController(), viewModel: dependencyContainer.createVetsViewModel())
        let appointmentsCoordinator = AppointmentsViewCoordinator(navigationController: UINavigationController(), viewModel: dependencyContainer.createAppointmentsViewModel())
        let tipsCoordinator = TipsViewCoordinator(navigationController: UINavigationController(), viewModel: dependencyContainer.createTipsViewModel())
        
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

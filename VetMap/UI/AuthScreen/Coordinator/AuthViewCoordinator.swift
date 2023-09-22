//
//  AuthViewCoordinator.swift
//  VetMap
//
//  Created by user on 20.09.2023.
//

import UIKit

class AuthViewCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var dependencyContainer: AppDependencyContainer
    weak var parentCoordinator: AppMainCoordinator?
    
    init(navigationController: UINavigationController, dependencyContainer: AppDependencyContainer, parentCoordinator: AppMainCoordinator?) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
        self.parentCoordinator = parentCoordinator
    }
    
    
    override func start() {
        let authViewModel = dependencyContainer.createAuthViewModel()
        authViewModel.openTheNextScreeen = { [weak self] in
            guard let self else { return }
            
            self.parentCoordinator?.openMainTabBar()
            self.finish()
        }
        
        let authViewController = AuthViewController(viewModel: authViewModel)
        navigationController.pushViewController(authViewController, animated: false)
        
        addChildCoordinator(self)
    }
    
    override func finish() {
        removeChildCoordinator(self)
    }
}

//
//  TipsViewCoordinator.swift
//  VetMap
//
//  Created by user on 08.08.2023.
//

import UIKit

class TipsViewCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    let viewModel: TipsViewModel
    
    init(navigationController: UINavigationController, viewModel: TipsViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    override func start() {
        
        let tipsViewController: TipsViewController = {
            let tipsViewController = TipsViewController(viewModel: viewModel)
            tipsViewController.view.backgroundColor = .white
            tipsViewController.title = "Tips"
            tipsViewController.tabBarItem.image = UIImage(systemName: "lightbulb")
            tipsViewController.tabBarItem.title = "Tips"
            return tipsViewController
        }()
        
        navigationController = UINavigationController(rootViewController: tipsViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always
    }
    
    
}

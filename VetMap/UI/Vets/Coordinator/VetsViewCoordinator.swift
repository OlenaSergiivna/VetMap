//
//  VetsViewCoordinator.swift
//  VetMap
//
//  Created by user on 07.08.2023.
//

import UIKit

class VetsViewCoordinator: Coordinator {
        
    var navigationController: UINavigationController
    let viewModel: VetsViewModel
    
    init(navigationController: UINavigationController, viewModel: VetsViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }

    override func start() {
         
         let vetsViewController: VetsViewController = {
             let vetsViewController = VetsViewController(viewModel: viewModel)
             vetsViewController.view.backgroundColor = .white
             vetsViewController.tabBarItem.image = UIImage(systemName: "pawprint")
             vetsViewController.tabBarItem.title = "Vets"
             return vetsViewController
         }()
         
         navigationController = UINavigationController(rootViewController: vetsViewController)
         navigationController.navigationItem.largeTitleDisplayMode = .always
    }
}

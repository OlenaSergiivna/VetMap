//
//  VetsViewCoordinator.swift
//  VetMap
//
//  Created by user on 07.08.2023.
//

import UIKit

class VetsViewCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

     func start() {
         
         let vetsViewModel = VetsViewModel()
         
         let vetsViewController: VetsViewController = {
             let vetsViewController = VetsViewController(viewModel: vetsViewModel)
             vetsViewController.view.backgroundColor = .white
             vetsViewController.tabBarItem.image = UIImage(systemName: "pawprint")
             vetsViewController.tabBarItem.title = "Vets"
             return vetsViewController
         }()
         
         navigationController = UINavigationController(rootViewController: vetsViewController)
         navigationController.navigationItem.largeTitleDisplayMode = .always
    }
}

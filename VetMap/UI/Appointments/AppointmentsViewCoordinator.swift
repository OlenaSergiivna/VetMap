//
//  AppointmentsViewCoordinator.swift
//  VetMap
//
//  Created by user on 08.08.2023.
//

import UIKit

class AppointmentsViewCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
        
    func start() {
        
        let appointmentsViewModel = AppointmentsViewModel()
        
        let appointmentsViewController: AppointmentsViewController = {
            let appointmentsViewController = AppointmentsViewController(viewModel: appointmentsViewModel)
            appointmentsViewController.view.backgroundColor = .white
            appointmentsViewController.tabBarItem.image = UIImage(systemName: "clock")
            appointmentsViewController.tabBarItem.title = "Appointments"
//            appointmentsViewController.title = "Appointments"
            return appointmentsViewController
        }()
        
        navigationController = UINavigationController(rootViewController: appointmentsViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .always
    }
    
    
}

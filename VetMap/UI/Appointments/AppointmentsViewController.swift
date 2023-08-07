//
//  AppointmentsViewController.swift
//  VetMap
//
//  Created by user on 05.08.2023.
//

import UIKit

class AppointmentsViewController: UIViewController {

    let contentView = AppointmentsScreenView()
    
    let viewModel: AppointmentsViewModel
    
    public init(viewModel: AppointmentsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

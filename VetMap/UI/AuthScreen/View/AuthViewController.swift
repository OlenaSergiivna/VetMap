//
//  AuthViewController.swift
//  VetMap
//
//  Created by user on 20.09.2023.
//

import UIKit

class AuthViewController: UIViewController {
    
    var viewModel: AuthViewModel
    
    init(viewModel: AuthViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


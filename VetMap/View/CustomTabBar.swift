//
//  CustomTabBar.swift
//  VetMap
//
//  Created by user on 03.07.2023.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarAppearance()
    }
    
    func setupTabBarAppearance() {

        tabBar.layer.cornerRadius = 40
        tabBar.layer.masksToBounds = true
    }
}

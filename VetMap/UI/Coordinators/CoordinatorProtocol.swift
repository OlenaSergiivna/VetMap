//
//  CoordinatorProtocol.swift
//  VetMap
//
//  Created by user on 07.08.2023.
//

import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    
    func start()
  
}

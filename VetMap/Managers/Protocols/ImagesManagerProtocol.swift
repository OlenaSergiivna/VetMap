//
//  ImagesManagerProtocol.swift
//  VetMap
//
//  Created by user on 01.08.2023.
//

import UIKit

protocol ImagesManagerProtocol {
    func setImage(imagePath: String, setFor image: UIImageView, cornerRadius: CGFloat)
    
    func setCasheLimits()
    
    func clearCashe()
}

//
//  ImagesManager.swift
//  VetMap
//
//  Created by user on 08.07.2023.
//

import Foundation
import Kingfisher

protocol ImagesManager {
    func setImage(imagePath: String, setFor image: UIImageView, cornerRadius: CGFloat)
    
    func setCasheLimits()
    
    func clearCashe()
}


struct ImagesManagerImpl: ImagesManager {
    
    func setImage(imagePath: String, setFor image: UIImageView, cornerRadius: CGFloat = 0) {
        
        let processor = DownsamplingImageProcessor(size: CGSize(width: 300, height: 150))
        |> RoundCornerImageProcessor(cornerRadius: cornerRadius)
        image.kf.indicatorType = .activity        
        
        image.kf.setImage(
            with: URL(string: imagePath),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                
            ])
        {
            result in
//            switch result {
//            case .success(let value):
//                print("Task done for: \(value.source.url?.absoluteString ?? "")")
//            case .failure(let error):
//                print("Task failed: \(error.localizedDescription)")
//
//            }
        }
    }
    
    
    
    private let cashe = ImageCache.default
    
    
    func setCasheLimits() {
        cashe.memoryStorage.config.totalCostLimit = 50 * 1024 * 1024
    }
    
    
    func clearCashe() {
        cashe.memoryStorage.removeAll()
    }
}

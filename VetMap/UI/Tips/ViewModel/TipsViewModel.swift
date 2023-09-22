//
//  TipsViewModel.swift
//  VetMap
//
//  Created by user on 06.07.2023.
//

import Foundation
import Bond

protocol TipsViewModel {
    var articles: Observable<[Article]> { get set }
    func updateArticles()
    func setImage(by imagePath: String, for image: UIImageView, withCornerRadius cornerRadius: CGFloat)
    func getPublicationDate(for date: String) -> Result<String, Error> 
}

class TipsViewModelImpl: TipsViewModel {
    
    var databaseManager: DatabaseManager
    var imagesManager: ImagesManager
    
    init(databaseManager: DatabaseManager, imagesManager: ImagesManager) {
        self.databaseManager = databaseManager
        self.imagesManager = imagesManager
    }
    
    var articles = Observable<[Article]>([])
    
    func updateArticles() {
        
        databaseManager.getUpdatedArticles { results in
            
            switch results {
            case .success(let articles):
                self.articles.value = articles
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
    func setImage(by imagePath: String, for image: UIImageView, withCornerRadius cornerRadius: CGFloat = 0) {
        imagesManager.setImage(imagePath: imagePath, setFor: image, cornerRadius: cornerRadius)
    }
    
    
    func getPublicationDate(for date: String) -> Result<String, Error> {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        guard let initialDate = dateFormatter.date(from: date) else {
            return .failure(GeneralErrors.failedWhenFormattingInitialDate)
        }
        
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let formattedDate = dateFormatter.string(from: initialDate)
        
        return .success(formattedDate)
    }
}

//
//  TipsViewModel.swift
//  VetMap
//
//  Created by user on 06.07.2023.
//

import Foundation
import Bond

class TipsViewModel {
    
    var articles = Observable<[Article]>([])
    
    func fetchArticles() {
        FirebaseManager.shared.getDataFromDatabase(for: "Tips") { result in
            
            switch result {
                
            case .success(let articles):
                self.articles.value = articles
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

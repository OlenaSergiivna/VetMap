//
//  DatabaseManager.swift
//  VetMap
//
//  Created by user on 12.07.2023.
//

import Foundation
import CoreData

struct DatabaseManager {
    
    let context = AppDelegate.viewContext
    
    func getUpdatedArticles(_ completion: @escaping (Result<[Article], Error>) -> Void) {
        
        syncLocalArticleEntitiesWithServer { result in
            
            switch result {
                
            case .success( _):
                do {
                  let articles = try ArticleEntity.getAllArticlesFromDB(context: context)
                    completion(.success(articles.map({Article(from: $0)})))
                    
                } catch let error {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func syncLocalArticleEntitiesWithServer(completion: @escaping  (Result<Bool, Error>) -> Void) {
        
        guard let localArticles = try? ArticleEntity.getAllArticlesFromDB(context: context) else {
            completion(.failure(GeneralErrors.cantGetAllArticlesFromDatabase))
            return
        }
        
        FirebaseManager.shared.getData(for: .tips) { result in
            
            switch result {
                
            case .success(let remoteArticles):
                
                for article in remoteArticles {
                    
                    // Update or create
                    let _ = ArticleEntity.createArticle(article: article, context: context)
                }
                
                // Delete
                let remoteArticleTitles = remoteArticles.map { $0.title }
                
                localArticles.forEach { localArticle in
                    if let title = localArticle.title,!remoteArticleTitles.contains(title) {
                        ArticleEntity.deleteArticle(article: localArticle, context: context)
                    }
                }
                
                //Save
                do {
                    try context.save()
                    completion(.success(true))
                } catch let error {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

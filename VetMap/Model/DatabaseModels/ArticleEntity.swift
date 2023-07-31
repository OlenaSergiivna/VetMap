//
//  DatabaseModels.swift
//  VetMap
//
//  Created by user on 16.07.2023.
//

import Foundation
import CoreData

class ArticleEntity: NSManagedObject {
    
    class func getAllArticlesFromDB(context: NSManagedObjectContext) throws -> [ArticleEntity] {
        let request: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "publicationDate", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            let articles = try context.fetch(request)
            return articles
        } catch {
            throw error
        }
    }
    
    
    class func createArticle(article: Article, context: NSManagedObjectContext) -> ArticleEntity {
        let articleEntity = ArticleEntity(from: article, context: context)
        return articleEntity
    }
    
    
    class func deleteArticle(article entity: ArticleEntity, context: NSManagedObjectContext) {
        context.delete(entity)
    }
    
    
    class func deleteAllArticles(context: NSManagedObjectContext) {
        
        let request: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
        request.includesPropertyValues = true
        
        do {
            let items = try context.fetch(request)
            
            for item in items {
                context.delete(item)
            }
            
            try context.save()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}


extension ArticleEntity {
    
    convenience init(from article: Article, context: NSManagedObjectContext) {
        self.init(context: context)
        publicationDate = article.publicationDate
        title = article.title
        text = article.text
        images = article.images
        videos = article.videos
        gifs = article.gifs
    }
}

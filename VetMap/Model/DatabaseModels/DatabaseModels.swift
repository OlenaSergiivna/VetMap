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
    
    
    class func createInDB(article: Article, context: NSManagedObjectContext) throws {
        
        let fetchRequest: NSFetchRequest<ArticleEntity> = ArticleEntity.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "title == %@", article.title)
           let existingArticles = try context.fetch(fetchRequest)
        
        let articleEntity = ArticleEntity(context: context)
        articleEntity.publicationDate = article.publicationDate
        articleEntity.title = article.title
        articleEntity.text = article.text
        articleEntity.images = article.images
        articleEntity.videos = article.videos
        articleEntity.gifs = article.gifs
        
        do {
            try context.save()
        } catch {
           throw error
        }
    }
    
    
    class func deleteAll(context: NSManagedObjectContext) {
       
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


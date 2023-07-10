//
//  ArticleModel.swift
//  VetMap
//
//  Created by user on 06.07.2023.
//

import Foundation

struct ArticleResults: Codable {
    let page: Int
    let results: [Article]
}


struct Article: Codable {
    let publicationDate: String
    let title: String
    let text: String
    let videos: [String]
    let images: [String]
    let gifs: [String]
    
    enum CodingKeys: String, CodingKey {
        case publicationDate = "publication_date"
        case title, text, videos, images, gifs
    }
}

//
//  DatabaseManagerProtocol.swift
//  VetMap
//
//  Created by user on 01.08.2023.
//

import Foundation

protocol DatabaseManagerProtocol {
    func getUpdatedArticles(_ completion: @escaping (Result<[Article], Error>) -> Void)
}

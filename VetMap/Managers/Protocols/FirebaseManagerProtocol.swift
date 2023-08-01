//
//  FirebaseManagerProtocol.swift
//  VetMap
//
//  Created by user on 01.08.2023.
//

import Foundation

protocol FirebaseManagerProtocol {
    func getData(for key: FirebaseKeys, page: Int, completion: @escaping(Result<[Article], Error>) -> Void)
}

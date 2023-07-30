//
//  FirebaseManager.swift
//  VetMap
//
//  Created by user on 06.07.2023.
//

import Foundation
import Firebase

struct FirebaseManager {
    
    static let shared = FirebaseManager()
    
    private init() {}
     
    private let database = Database.database().reference()
    
    
    func getData(for key: FirebaseKeys, page: Int? = 0, completion: @escaping(Result<[Article], Error>) -> Void) {
        let query = database.child(key.rawValue).queryOrdered(byChild: "page").queryEqual(toValue: 0)
        query.observeSingleEvent(of: .value) { snapshot, _ in
           
            guard snapshot.exists() else {
                print("Snapshot value is nil")
                return
            }

            do {
                let data = snapshot.value
                let jsonData = try JSONSerialization.data(withJSONObject: data)
                let decoder = JSONDecoder()
                let dataDecoded = try decoder.decode([ArticleResults].self, from: jsonData)
                guard let articles = dataDecoded.first?.results else { return }
                completion(.success(articles))
            } catch {
                completion(.failure(error))
            }
        }
    }
}


enum FirebaseKeys: String {
    case tips = "Tips"
}

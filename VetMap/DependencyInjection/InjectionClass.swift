//
//  InjectionClass.swift
//  VetMap
//
//  Created by user on 01.08.2023.
//

import Foundation
import Swinject

final class Injection {
    
    static let shared = Injection()
    
    var container: Container {
        get {
            if _container == nil {
                _container = buildContainer()
            }
            return _container!
        }
        set {
            _container = newValue
        }
    }
    
    private var _container: Container?
    
    private func buildContainer() -> Container {
        let container = Container()
        container.register(DatabaseManagerProtocol.self) { _ in return DatabaseManager() }
        container.register(ImagesManagerProtocol.self) { _ in return ImagesManager() }
        container.register(FirebaseManagerProtocol.self) { _ in return FirebaseManager() }
        container.register(MapManagerProtocol.self) { _ in return MapManager() }
        container.register(LocationManagerProtocol.self) { _ in return LocationManager() }
        return container
    }
}

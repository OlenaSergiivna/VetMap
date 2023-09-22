//
//  AppDependencyContainer.swift
//  VetMap
//
//  Created by user on 20.09.2023.
//

import Foundation

class AppDependencyContainer {
    
    func createDatabaseManager() -> DatabaseManager {
        return DatabaseManagerImpl(firebaseManager: createFirebaseManager())
    }

    func createFirebaseManager() -> FirebaseManager {
        return FirebaseManagerImpl()
    }
    
    func createMapManager() -> MapManager {
        return MapManagerImpl()
    }
    
    func createImagesManager() -> ImagesManager {
        return ImagesManagerImpl()
    }
    
    func createLocalManager() -> LocationManager {
        return LocationManagerImpl()
    }
    
    
    func createAuthViewModel() -> AuthViewModel {
        return AuthViewModelImpl()
    }
    
    func createVetsViewModel() -> VetsViewModel {
        return VetsViewModelImpl(mapManager: createMapManager(), locationManager: createLocalManager())
    }
    
    func createAppointmentsViewModel() -> AppointmentsViewModel {
        return AppointmentsViewModelImpl()
    }

    func createTipsViewModel() -> TipsViewModel {
        return TipsViewModelImpl(databaseManager: createDatabaseManager(), imagesManager: createImagesManager())
    }
}

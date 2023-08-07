//
//  MapManager.swift
//  VetMap
//
//  Created by user on 26.06.2023.
//

import Foundation
import MapKit

class MapManager: MapManagerProtocol {
    
    func createMapPin(with location: CLLocation, completion: @escaping(MKPointAnnotation?) -> Void) {
        
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        
        completion(pin)
    }
    
    func searchVeterinaryClinics(for region: MKCoordinateRegion, completion: @escaping([MKMapItem]) -> Void) {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "ветеринарная клиника"
        request.region = region
        
        let search = MKLocalSearch(request: request)
        
        search.start { response, _ in
            guard let response = response else { return }
            completion(response.mapItems)
        }
    }
    
    
    func drawARoute(userLocation: CLLocationCoordinate2D, targetLocation: CLLocationCoordinate2D, completion: @escaping (Result<[MKRoute], Error>) -> Void) {
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: targetLocation))
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        directions.calculate { (response, error) in
            
            switch (response?.routes, error) {
                
            case let (.some(routes), _):
                completion(.success(routes))
                
            case let (_, error?):
                completion(.failure(error))
                
            default:
                let noRoutesError = NSError(domain: "NoRoutesError", code: 0, userInfo: nil)
                completion(.failure(noRoutesError))
            }
        }
    }
}

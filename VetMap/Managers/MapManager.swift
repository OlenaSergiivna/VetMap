//
//  MapManager.swift
//  VetMap
//
//  Created by user on 26.06.2023.
//

import Foundation
import MapKit

class MapManager {
    
    static let shared = MapManager()
    
    private init() {}
    
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
}

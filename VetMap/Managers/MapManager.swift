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
    
    func addMapPin(with location: CLLocation, for map: MKMapView, completion: @escaping(String?) -> Void) {
        
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        
        map.addAnnotation(pin)
        
        LocationManager.shared.addLocationName(with: location) { locationName in
            completion(locationName)
        }
    }
}

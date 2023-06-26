//
//  LocationManager.swift
//  VetMap
//
//  Created by user on 26.06.2023.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    
    let manager = CLLocationManager()
    
    var completion: ((CLLocation) -> Void)?
    
    
    func getUserLocation(completion: @escaping (CLLocation)-> Void) {
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    
    func addLocationName(with location: CLLocation, completion: @escaping (String?) -> Void){
        let geoCoder =  CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location, preferredLocale: .current) { placemarks, error in
            
            guard let place = placemarks?.first, error == nil else {
                completion(nil)
                return
            }
            
            var name = ""
            
            if let locality = place.locality {
                name += locality
            }
            
            if let adminRegion = place.administrativeArea {
                name += ", \(adminRegion)"
            }
            
            completion(name)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        completion?(location)
        manager.stopUpdatingLocation()
    }
}

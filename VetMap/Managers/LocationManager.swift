//
//  LocationManager.swift
//  VetMap
//
//  Created by user on 26.06.2023.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, LocationManagerProtocol {
    
    let manager = CLLocationManager()
    
    var completion: ((CLLocation) -> Void)?
    
    private var didUpdateLocation = false
    
    func getUserLocation(completion: @escaping (CLLocation)-> Void) {
        didUpdateLocation = false
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    
    func getLocationName(with location: CLLocation, completion: @escaping (String?) -> Void){
        let geoCoder =  CLGeocoder()
        
        let preferredLocale = Locale(identifier: "uk_UA")
        
        geoCoder.reverseGeocodeLocation(location, preferredLocale: preferredLocale) { placemarks, error in
            
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
        guard let location = locations.first, didUpdateLocation == false else { return }
        completion?(location)
        manager.stopUpdatingLocation()
        didUpdateLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error when getting location")
    }
}

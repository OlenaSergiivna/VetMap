//
//  MapViewVodel.swift
//  VetMap
//
//  Created by user on 27.06.2023.
//

import Foundation
import MapKit
import Bond

class MapViewModel {
    
    var mapTitle = Observable<String>("")
    
    var mapPin = Observable<MKPointAnnotation>(MKPointAnnotation())
    
    var mapCenter = Observable<CLLocationCoordinate2D>(CLLocationCoordinate2D())
    
    var vets = MutableObservableArray<MKMapItem>([])
    
    func fetchMapData() {
        
        LocationManager.shared.getUserLocation { location in
            
            self.createMapPin(location: location)
            
            self.getMapCenter(with: location)
            
            self.getLocationName(location: location)
        }
    }
    
    
    private func createMapPin(location: CLLocation) {
        MapManager.shared.createMapPin(with: location) { pin in
            guard let pin else { return }
            self.mapPin.value = pin
        }
    }
    
    
    private func getMapCenter(with location: CLLocation) {

        mapCenter.value = location.coordinate
    }
    
    
    private func getLocationName(location: CLLocation) {
        
        LocationManager.shared.getLocationName(with: location) { locationName in
            guard let locationName else { return }
            
            self.mapTitle.value = locationName
        }
    }
    
    
    func getVetsData(for region: MKCoordinateRegion) {
        
        MapManager.shared.searchVeterinaryClinics(for: region) { vets in
            self.vets.insert(contentsOf: vets, at: 0)
        } 
    }
}

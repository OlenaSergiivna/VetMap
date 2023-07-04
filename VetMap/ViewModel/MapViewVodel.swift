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
    
    var vetsAnnotations = MutableObservableArray<MKPointAnnotation>([])
    
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
    
    
    func getVetsAnnotations(for region: MKCoordinateRegion) {
        
        MapManager.shared.searchVeterinaryClinics(for: region) { vets in
            
            var annotations = [MKPointAnnotation]()
            
            vets.forEach( { vet in
                guard vet.placemark.country == "Україна" || vet.placemark.country == "Ukraine" || vet.placemark.country == "Украина" else { return }
                let annotation = MKPointAnnotation()
                annotation.coordinate = vet.placemark.coordinate
                annotation.title = vet.placemark.name
                annotations.append(annotation)
            })
            
            self.vetsAnnotations.insert(contentsOf: annotations, at: 0)
        }
    }
    
    
    func buildARoute(targetLocation: CLLocationCoordinate2D, completion: @escaping([MKRoute]) -> Void) {
        
        LocationManager.shared.getUserLocation { location in
            MapManager.shared.drawARoute(userLocation: location.coordinate, targetLocation: targetLocation) { result in
                
                switch result {
                case .success(let routes):
                    completion(routes)
                case .failure(let error):
                    print("Error while building a route: \(error)")
                }
            }
        }
    }
}

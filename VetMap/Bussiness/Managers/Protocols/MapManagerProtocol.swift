//
//  MapManagerProtocol.swift
//  VetMap
//
//  Created by user on 01.08.2023.
//

import Foundation
import CoreLocation
import MapKit

protocol MapManagerProtocol {
    func createMapPin(with location: CLLocation, completion: @escaping(MKPointAnnotation?) -> Void)
    
    func searchVeterinaryClinics(for region: MKCoordinateRegion, completion: @escaping ([MKMapItem]) -> Void)

    func drawARoute(userLocation: CLLocationCoordinate2D, targetLocation: CLLocationCoordinate2D, completion: @escaping (Result<[MKRoute], Error>) -> Void)
}

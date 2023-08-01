//
//  LocationManagerProtocol.swift
//  VetMap
//
//  Created by user on 01.08.2023.
//

import Foundation
import CoreLocation

protocol LocationManagerProtocol {
    func getUserLocation(completion: @escaping (CLLocation)-> Void)
    
    func getLocationName(with location: CLLocation, completion: @escaping (String?) -> Void)
}

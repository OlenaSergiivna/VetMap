//
//  ViewController.swift
//  VetMap
//
//  Created by user on 26.06.2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    private let map: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        
        LocationManager.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                guard let self else { return }
                
                MapManager.shared.addMapPin(with: location, for: self.map) { locationName in
                    self.navigationItem.title = locationName
                }
            }
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        map.frame = view.bounds
    }
    
}


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
    
    private let mapViewModel = MapViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(map)
        
        mapViewModel.fetchMapData()
        
        self.mapViewModel.mapTitle
            .dropFirst(1)
            .bind(to: self) { _, mapTitle in
                
            self.navigationItem.title = mapTitle
        }

        
        self.mapViewModel.mapPin
            .dropFirst(1)
            .bind(to: self) { _, pin in
                
            self.map.addAnnotation(pin)
        }
          
        
        self.mapViewModel.vets
            .dropFirst(1)
            .bind(to: self) { _, vets in
            print("vets count: \(vets.collection.count)")
        }
        
        
        self.mapViewModel.mapCenter
            .dropFirst(1)
            .bind(to: self) { _, mapCenter in
            
            let region = MKCoordinateRegion(center: mapCenter, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            self.map.setRegion(region, animated: true)
            
            self.mapViewModel.getVetsData(for: region)
            
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        map.frame = view.bounds
    }
    
}


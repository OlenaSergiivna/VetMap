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
        mapView.mapType = .standard
        return mapView
    }()
    
    private let mapViewModel = MapViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(map)
        
        map.delegate = self
        
        mapViewModel.fetchMapData()
        
        self.mapViewModel.mapTitle
            .dropFirst(1)
            .bind(to: self) { _, mapTitle in
                
                self.navigationItem.title = mapTitle
                self.adjustLargeTitleSize()
            }
        
        
        self.mapViewModel.mapPin
            .dropFirst(1)
            .bind(to: self) { _, pin in
                pin.title = "Ви тут"
                self.map.addAnnotation(pin)
            }
        
        
        self.mapViewModel.mapCenter
            .dropFirst(1)
            .bind(to: self) { _, mapCenter in
                
                let region = MKCoordinateRegion(center: mapCenter, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
                self.map.setRegion(region, animated: true)
                
                self.mapViewModel.getVetsAnnotations(for: region)
            }
        
        
        self.mapViewModel.vetsAnnotations
            .dropFirst(1)
            .bind(to: self) { _, vetsAnnotations in
                
                self.map.addAnnotations(vetsAnnotations.collection)
                self.map.showAnnotations(self.map.annotations, animated: false)
            }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        map.frame = view.bounds
    }
}


extension MapViewController: MKMapViewDelegate {
    
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let cluster = annotation as? MKClusterAnnotation {
            
            var clusterView = mapView.dequeueReusableAnnotationView(withIdentifier: "cluster") as? MKMarkerAnnotationView
            
            if clusterView == nil {
                clusterView = MKMarkerAnnotationView(annotation: cluster, reuseIdentifier: "cluster")
            } else {
                clusterView?.annotation = cluster
            }
            
            clusterView?.markerTintColor = UIColor.systemTeal
            clusterView?.glyphText = "\(cluster.memberAnnotations.count)"
            
            return clusterView
            
        } else {
            
            guard annotation.title != "Ви тут" else { return nil }
            
            var annotationView = self.map.dequeueReusableAnnotationView(withIdentifier: "custom")
            
            if annotationView == nil {
                annotationView = CustomMarkerAnnotationView(annotation: annotation, reuseIdentifier: "custom")
                annotationView?.canShowCallout = true
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
    }
}

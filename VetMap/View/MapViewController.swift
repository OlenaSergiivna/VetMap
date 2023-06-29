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
                self.adjustLargeTitleSize()
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


extension UIViewController {
    
    func adjustLargeTitleSize() {
        
        guard let title = navigationItem.title, #available(iOS 11.0, *) else { return }
        
        let maxWidth = UIScreen.main.bounds.size.width - 60
        var fontSize = UIFont.preferredFont(forTextStyle: .largeTitle).pointSize
        
        var width = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)]).width
        
        while width > maxWidth {
            fontSize -= 1
            width = title.size(withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: fontSize)]).width
        }
        
        let font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }
}

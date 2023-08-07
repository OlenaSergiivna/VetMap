//
//  CustomAnnotationView.swift
//  VetMap
//
//  Created by user on 01.07.2023.
//

import Foundation
import MapKit


class CustomMarkerAnnotationView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? { willSet { newValue.flatMap(configure(with:)) } }
    
    func configure(with annotation: MKAnnotation) {
        glyphImage = UIImage(named: "vets")
        glyphTintColor = .white
        markerTintColor = .systemTeal
        clusteringIdentifier = String(describing: CustomMarkerAnnotationView.self)
    }
}

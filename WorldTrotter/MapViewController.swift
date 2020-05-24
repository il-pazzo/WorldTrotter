//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Glenn Cole on 5/23/20.
//  Copyright © 2020 Glenn Cole. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    struct mapSegment {
        let name: String
        let mapType: MKMapType
    }
    let mapSegments = [
        mapSegment( name: "Map", mapType: .standard ),
        mapSegment( name: "Hybrid", mapType: .hybrid ),
        mapSegment( name: "Satellite", mapType: .satellite ),
    ]

    override func loadView() {
        
        mapView = MKMapView()
        self.view = mapView
        
        addSegmentedControl( to: view )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print( "MapViewController loaded its view" )
    }
    

    // MARK: - Segmented Control setup
    
    private func addSegmentedControl( to view: UIView ) {
        
        let segmentedControl = buildSegmentedControl()
        view.addSubview( segmentedControl )
        
        addConstraints( for: segmentedControl, to: view )

        segmentedControl.addTarget( self,
                                    action: #selector(mapTypeChanged(_:)),
                                    for: .valueChanged )
    }
    private func buildSegmentedControl() -> UISegmentedControl {
        
        let segmentedControl = UISegmentedControl( items: mapSegments.map { $0.name })
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentedControl
    }
    private func addConstraints( for segmentedControl: UISegmentedControl, to view: UIView ) {

        let topConstraint = segmentedControl.topAnchor.constraint( equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                                   constant: 8 )
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint( equalTo: margins.leadingAnchor )
        let trailingConstraint = segmentedControl.trailingAnchor.constraint( equalTo: margins.trailingAnchor )
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    // MARK: - React to user action
    
    @objc func mapTypeChanged( _ segControl: UISegmentedControl ) {

        let segmentIndex = segControl.selectedSegmentIndex
        
        guard segmentIndex >= 0 && segmentIndex < mapSegments.count else {
            return
        }
        
        mapView.mapType = mapSegments[ segmentIndex ].mapType
    }
}

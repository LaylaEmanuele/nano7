//
//  MarkView.swift
//  nano7
//
//  Created by Philippe Venancio on 18/11/21.
//

import UIKit
import MapKit

class MarkViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPinMap(coordinate: CLLocationCoordinate2D(latitude: -15.84173355916682, longitude: -48.04400844933156))
        addPinMap(coordinate: CLLocationCoordinate2D(latitude: -15.83373814676899, longitude: -47.95538323261778))
        
        //let region = MKCoordinateRegion()
        
    }
    
    func addPinMap(coordinate: CLLocationCoordinate2D){
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    
}

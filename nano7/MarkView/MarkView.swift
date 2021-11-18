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
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocationCoordinate2D(latitude: -22.9035393, longitude: -43.2095869)
        
        mapView.addAnnotation(annotation)
        
    }
    
    func addPinMap(  ){
        
    }
    
}

//
//  MarkView.swift
//  nano7
//
//  Created by Philippe Venancio on 18/11/21.
//

import UIKit
import CoreLocation
import MapKit

class MarkViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var targetView: UIView!
    
    let locationManager = CLLocationManager()
    
    var numberOfPins = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self,
                                                       action:#selector(handleTap))
            gestureRecognizer.delegate = self
            mapView.addGestureRecognizer(gestureRecognizer)
        
//        addPinMap(CLLocationCoordinate2D(latitude: -15.84173355916682, longitude: -48.04400844933156))
//        addPinMap(CLLocationCoordinate2D(latitude: -15.83373814676899, longitude: -47.95538323261778))
        
        presentTabBar()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    @objc func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        
        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        
        // Add annotation:
        addPinMap(coordinate)
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        if let location = locations.first{
            
            manager.stopUpdatingLocation()
            render(location)
            
//            print("locations = \(location.coordinate.latitude) \(location.coordinate.longitude)")
        }
        
    }
    
    func render(_ location: CLLocation){
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.009,
                                    longitudeDelta: 0.009)
        
        let region = MKCoordinateRegion(center: coordinate,
                                        span: span)
        
        mapView.setRegion(region, animated: true)
        
        addPinMap(coordinate)
        // TELL ME WHY-> Para confirmar a numeração correta dos pins
        numberOfPins = 1
    }
    
    func addPinMap(_ coordinate: CLLocationCoordinate2D){
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        numberOfPins = numberOfPins + 1
        pin.title = "\(numberOfPins)"
        mapView.addAnnotation(pin)
    }
    
    func presentTabBar() {
        
        let nib = Bundle.main.loadNibNamed("MarkViewTabBar",
                                            owner: self,
                                            options: nil)?.first as? MarkViewTabBarViewController ?? nil
        
        if let myNib = nib {
            targetView.addSubview(myNib)
            
            myNib.translatesAutoresizingMaskIntoConstraints = false
            
            let constraint_leading = NSLayoutConstraint(item: myNib, attribute: .leading, relatedBy: .equal, toItem: self.targetView, attribute: .leading, multiplier: 1, constant: 0)
            let constraint_trailing = NSLayoutConstraint(item: myNib, attribute: .trailing, relatedBy: .equal, toItem: self.targetView, attribute: .trailing, multiplier: 1, constant: 0)
            let constraint_top = NSLayoutConstraint(item: myNib, attribute: .top, relatedBy: .equal, toItem: self.targetView, attribute: .top, multiplier: 1, constant: 0)
            let constraint_height = NSLayoutConstraint(item: myNib, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 128)
            
            self.targetView.addConstraint(constraint_leading)
            self.targetView.addConstraint(constraint_trailing)
            self.targetView.addConstraint(constraint_top)
            
            myNib.addConstraint(constraint_height)
            
        }
    }
}

//
//  MapViewController.swift
//  nano7
//
//  Created by Layla Emanuele on 17/11/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, Coordinating, CLLocationManagerDelegate, UIGestureRecognizerDelegate {
    var coordinater: Coordinator?
    var locationManager: CLLocationManager?
    
    // MARK: - Variables and Constants
    private unowned var screenView: MapView { return self.view as! MapView }
    private var dealerSelectionView = MapView()
    
    // MARK: - LifeCycle
    override func loadView() {
        super.view = dealerSelectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        askLocationPerms()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self,
                                                       action:#selector(handleTap))
            gestureRecognizer.delegate = self
            dealerSelectionView.map.addGestureRecognizer(gestureRecognizer)
        
        //addPinMap(CLLocationCoordinate2D(latitude: -15.84173355916682, longitude: -48.04400844933156))
        
    }
    
    // MARK: - Setup
    private func setup() {
        setupNavigation()
    }
    
    private func setupNavigation() {
        
    }
    
    @objc func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        
        let location = gestureRecognizer.location(in: dealerSelectionView.map)
        let coordinate = dealerSelectionView.map.convert(location, toCoordinateFrom: dealerSelectionView.map)
        
        // Add annotation:
        addPinMap(coordinate)
    
    }
    
    
    private func askLocationPerms() {
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        //locationManager?.requestWhenInUseAuthorization()
        
        locationManager?.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus, didUpdateLocations locations: [CLLocation]) {
        if status == .authorizedAlways {
            
            if let location = locations.first{
                
                manager.stopUpdatingLocation()
                render(location)
            }
            
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    print("Poggers")
                }
            }
        } else if status == .denied {
            print("Rest in pepperoni")
            UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
        }
    }
    
    func render(_ location: CLLocation){
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.009,
                                    longitudeDelta: 0.009)
        
        let region = MKCoordinateRegion(center: coordinate,
                                        span: span)
        
        dealerSelectionView.map.setRegion(region, animated: true)
        
        //addPinMap(coordinate)
        // TELL ME WHY-> Para confirmar a numeração correta dos pins
        //numberOfPins = 1
    }
    
    func addPinMap(_ coordinate: CLLocationCoordinate2D){
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
//        numberOfPins = numberOfPins + 1
//        pin.title = "\(numberOfPins)"
        dealerSelectionView.map.addAnnotation(pin)
    }
    
}


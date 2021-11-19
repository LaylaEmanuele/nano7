//
//  MapViewController.swift
//  nano7
//
//  Created by Layla Emanuele on 17/11/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, UIGestureRecognizerDelegate, Coordinating, MKMapViewDelegate {
    var coordinater: Coordinator?
    var locationManager: CLLocationManager?
    var tabBar: MarkViewTabBarWrapper!
    
    var pins = [MKPointAnnotation]()
    
    
    // MARK: - Variables and Constants
    private unowned var screenView: MapView { return self.view as! MapView }
    private var dealerSelectionView = MapView()
    
    // MARK: - LifeCycle
    override func loadView() {
        super.view = dealerSelectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar = MarkViewTabBarWrapper(owner: self)
        
        tabBar.clearPinCount()
        
        tabBar.setDelegate(self)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self,
                                                       action:#selector(handleTap))
            gestureRecognizer.delegate = self
            dealerSelectionView.map.addGestureRecognizer(gestureRecognizer)
        
        //addPinMap(CLLocationCoordinate2D(latitude: -15.84173355916682, longitude: -48.04400844933156))

        self.screenView.map.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        askLocationPerms()
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
    
    func render(_ location: CLLocation){
        
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.009,
                                    longitudeDelta: 0.009)
        
        let region = MKCoordinateRegion(center: coordinate,
                                        span: span)
        
        
        dealerSelectionView.map.setRegion(region, animated: true)
        
    }
    
    //MARK: - ADD Pin in Map
    func addPinMap(_ coordinate: CLLocationCoordinate2D){
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        tabBar.increasePinCount()
        pin.title = "\(tabBar.pinCount)"
        dealerSelectionView.map.addAnnotation(pin)
        
        pins.append(pin)
        
    }
    
    
    func removeAllPins(){
        dealerSelectionView.map.removeAnnotations(pins)
        pins.removeAll()
        tabBar.clearPinCount()
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay)
        render.strokeColor = UIColor.red
        render.lineWidth = 4.0
        return render
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if let location = locations.first{
            manager.stopUpdatingLocation()
            render(location)
        }
        
    }
    
    private func askLocationPerms() {
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        //locationManager?.requestWhenInUseAuthorization()
        
        locationManager?.startUpdatingLocation()
        
    }
    
}

extension MapViewController: MarkViewTabBarDelegate {
    
    func finishButtonPressed() {
        for index in 1..<pins.count {
            print("INDEX >>> \(index)")
            let sourcePlaceMark = MKPlacemark(coordinate: pins[index-1].coordinate)
            let destinantionPlaceMark = MKPlacemark(coordinate: pins[index].coordinate)
            
            let directionRequest = MKDirections.Request()
            directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
            directionRequest.destination = MKMapItem(placemark: destinantionPlaceMark)
            directionRequest.transportType = .automobile
            
            let directions = MKDirections(request: directionRequest)
            directions.calculate{ (response , error) in
                guard let directionResponse = response else{
                    if let error = error{
                        print("Erro nas direções==\(error.localizedDescription)")
                    }
                    return
                }
                let route = directionResponse.routes[0]
                self.screenView.map.addOverlay(route.polyline, level: .aboveRoads)
                let rect = route.polyline.boundingMapRect
                self.screenView.map.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }
        
        
        
    }
    
    func clearButtonPressed() {
        removeAllPins()
    }
    
}

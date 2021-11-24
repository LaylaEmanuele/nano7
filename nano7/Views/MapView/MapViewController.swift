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
    
    enum TabBarType {
        case MarkView
        case ShareView
    }
    
    var coordinater: Coordinator?
    var locationManager: CLLocationManager?
    
    struct TabBar {
        var type: TabBarType {
            didSet {
                switch type {
                case .MarkView:
                    tabBarRef = (MarkViewTabBarWrapper(owner: owner), nil)
                case .ShareView:
                    tabBarRef = (nil, ShareViewTabBarWrapper(owner: owner))
                }
            }
        }
        private var owner: UIViewController
        
        private var tabBarRef: (MarkViewTabBarWrapper?, ShareViewTabBarWrapper?)
        
        func getMarkView() -> MarkViewTabBarWrapper? {
            tabBarRef.0
        }
        
        func getShareView() -> ShareViewTabBarWrapper? {
            tabBarRef.1
        }
        
        init(owner: UIViewController) {
            self.owner = owner
            self.type = .MarkView
        }
        
    }

    var tabBar: TabBar!
    
    var pins = [MKPointAnnotation]()
    
    
    // MARK: - Variables and Constants
    private unowned var screenView: MapView { return self.view as! MapView }
    private var dealerSelectionView = MapView()
    
    // MARK: - LifeCycle
    override func loadView() {
        super.view = dealerSelectionView
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar = TabBar(owner: self)
        
        tabBar.type = .MarkView
        
        if let markView = tabBar.getMarkView() {

            markView.clearPinCount()

            markView.setDelegate(self)

        }
        
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
        
        if let markView = tabBar.getMarkView() {
        
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            markView.increasePinCount()
            pin.title = "\(markView.pinCount)"
            dealerSelectionView.map.addAnnotation(pin)
            
            pins.append(pin)
        
        }
    }
    
    
    func removeAllPins(){
        dealerSelectionView.map.removeAnnotations(pins)
        pins.removeAll()
        if let markView = tabBar.getMarkView() {
            markView.clearPinCount()
        }
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
        if pins.count > 1 {
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
            
            // Show ShareView tab bar
            if let markView = tabBar.getMarkView() {
                markView.dismissView()
            }
            tabBar.type = .ShareView
        
            if let shareView = tabBar.getShareView() {

                shareView.setDelegate(self)

            }
            
        }
    }
    
    func clearButtonPressed() {
        removeAllPins()
    }
    
}

extension MapViewController: ShareViewTabBarDelegate {
    
    func backButtonPresesd() {
        // pop view aq
        print("voltar view")
        coordinater?.eventOcurred(with: .buttonTapped)
    }
    
    func downloadButtonPressed() {
        print("download")
        DataShareHandler.saveImage(from: dealerSelectionView)
            
    }
    
    func shareButtonPressed() {
        print("share")
//        DataShareHandler.shareImage(from: view, presentOn: self)
    }
    
}

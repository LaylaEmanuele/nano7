//
//  RouteViewController.swift
//  nano7
//
//  Created by Matheus de Sousa Matos on 18/11/21.
//

import UIKit
import CoreLocation
import MapKit

class RouteViewController: UIViewController, Coordinating , MKMapViewDelegate, CLLocationManagerDelegate{

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
        dealerSelectionView.backgroundColor = .red
        askLocationPerms()
        
        let vcMap = MapViewController()
        
        let pins = vcMap.pins
        
        print(pins.count)
        pins.forEach { pin in
            printContent("Aki ooo")
            self.screenView.map.addAnnotation(pin)
        }
        
        //MARK: - Localização dos Pins
//        var locations: [CLLocationCoordinate2D] = [
//            CLLocationCoordinate2D(latitude: 39.173209, longitude: -94.593993),
//            CLLocationCoordinate2D(latitude: 38.643172, longitude: -90.177429),
//            CLLocationCoordinate2D(latitude: 37.643172, longitude: -88.177429)
//        ]
//
//        let poli = MKPolyline(coordinates: locations, count: locations.count)
//
//        //Implementar array para testar...
//        let sourceLocation = CLLocationCoordinate2D(latitude: 39.173209, longitude: -94.593993)
//        let destinationLocation = CLLocationCoordinate2D(latitude: 38.643172, longitude: -90.177429)
//        let secundaryLocation = CLLocationCoordinate2D(latitude: 37.643172, longitude: -88.177429)
//
        
        
//        let sourcePin = CustomPin(pinTitle: "Kan", pinSubtitle: "" , location: sourceLocation)
//        let destinationPin = CustomPin(pinTitle: "St. Louis", pinSubtitle: "" , location: destinationLocation)
//        let secundaryPin = CustomPin(pinTitle: "Secundary", pinSubtitle: "", location: secundaryLocation)
//
//        self.screenView.map.addAnnotation(sourcePin)
//        self.screenView.map.addAnnotation(destinationPin)
//        self.screenView.map.addAnnotation(secundaryPin)
//
//        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation)
//        let destinantionPlaceMark = MKPlacemark(coordinate: destinationLocation)
//        let secundaryPinPlaceMark = MKPlacemark(coordinate: secundaryLocation)
//
//        let directionRequest = MKDirections.Request()
//        directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
//        directionRequest.destination = MKMapItem(placemark: destinantionPlaceMark)
//        directionRequest.transportType = .automobile
//
//        let directions = MKDirections(request: directionRequest)
//        directions.calculate{ (response , error) in
//            guard let directionResponse = response else{
//                if let error = error{
//                    print("Erro nas direções==\(error.localizedDescription)")
//                }
//                return
//            }
//            let route = directionResponse.routes[0]
//            self.screenView.map.addOverlay(route.polyline, level: .aboveRoads)
//            let rect = route.polyline.boundingMapRect
//            self.screenView.map.setRegion(MKCoordinateRegion(rect), animated: true)
//        }
//
        self.screenView.map.delegate = self
        
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay)
        render.strokeColor = UIColor.red
        render.lineWidth = 4.0
        return render
    }
    
    // MARK: - Setup
    private func setup() {
        setupNavigation()
    }
    
    private func setupNavigation() {
        
    }
    
    private func askLocationPerms() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
    }
    
    @objc(locationManager:didChangeAuthorizationStatus:) func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
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

}

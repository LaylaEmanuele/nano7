//
//  MapViewController.swift
//  nano7
//
//  Created by Layla Emanuele on 17/11/21.
//

import UIKit
import CoreLocation

class MapViewController: UIViewController, Coordinating, CLLocationManagerDelegate {
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
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
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


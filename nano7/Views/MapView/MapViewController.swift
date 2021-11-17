//
//  MapViewController.swift
//  nano7
//
//  Created by Layla Emanuele on 17/11/21.
//

import UIKit

class MapViewController: UIViewController, Coordinating {
    var coordinater: Coordinator?
    
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
    }
    
    // MARK: - Setup
    private func setup() {
        setupNavigation()
    }
    
    private func setupNavigation() {
        
    }
    
}


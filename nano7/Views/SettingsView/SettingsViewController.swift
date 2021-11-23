//
//  SettingsViewController.swift
//  nano7
//
//  Created by Layla Emanuele on 22/11/21.
//

import UIKit

class SettingsViewController: UIViewController, Coordinating {
    var coordinater: Coordinator?
    
    // MARK: - Variables and Constants
    private unowned var settingsView: SettingsView { return self.view as! SettingsView }
    private var dealerSelectionView = SettingsView()
    
    
    // MARK: - LifeCycle
    override func loadView() {
        super.view = dealerSelectionView
        dealerSelectionView.backgroundColor = UIColor(named: "bgColorInitialScreen")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


//
//  ViewController.swift
//  nano7
//
//  Created by Layla Emanuele on 17/11/21.
//

import UIKit

class InitialViewController: UIViewController {
    // MARK: - Variables and Constants
    private unowned var screenView: InitialView { return self.view as! InitialView }
    private var dealerSelectionView = InitialView()
    
    // MARK: - LifeCycle
    convenience init() {
        self.init()
    }
    override func loadView() {
        super.view = dealerSelectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dealerSelectionView.backgroundColor = .orange
    }
    
    // MARK: - Setup
    private func setup() {
        setupNavigation()
    }
    
    private func setupNavigation() {
       
    }
    
}


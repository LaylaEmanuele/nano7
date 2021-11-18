//
//  ViewController.swift
//  nano7
//
//  Created by Layla Emanuele on 17/11/21.
//

import UIKit


class InitialViewController: UIViewController, Coordinating {
    var coordinater: Coordinator?
    
    // MARK: - Variables and Constants
    private unowned var screenView: InitialView { return self.view as! InitialView }
    private var dealerSelectionView = InitialView()
    
    
    // MARK: - LifeCycle
    override func loadView() {
        super.view = dealerSelectionView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dealerSelectionView.backgroundColor = UIColor(named: "bgColorInitialScreen")
        dealerSelectionView.button.center = view.center
        dealerSelectionView.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    // MARK: - Setup
    private func setup() {
        setupNavigation()
    }
    
    private func setupNavigation() {
       
    }
    @objc func didTapButton() {
        coordinater?.eventOcurred(with: .buttonTapped)
    }
}


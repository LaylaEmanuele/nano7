//
//  MainCoordinator.swift
//  nano7
//
//  Created by Layla Emanuele on 17/11/21.
//

import UIKit

class MainCoordinator: Coordinator{
    var navigationController: UINavigationController?
    var children: [Coordinator]? = nil
    
    func eventOcurred(with type: Event) {
        switch type {
        case .buttonTapped:
            var vc: UIViewController & Coordinating = MapViewController()
            vc.coordinater = self
            navigationController?.pushViewController(vc, animated: true)
        
        case .finishButtonPressed:
            print("Entrei no case ")
            var routeVC: UIViewController & Coordinating = RouteViewController()
            routeVC.coordinater = self
            navigationController?.pushViewController(routeVC, animated: true)
        
        }
    }
    
    func start() {
        var vc: UIViewController & Coordinating = InitialViewController()
        vc.coordinater = self
        navigationController?.setViewControllers([vc], animated: false)
    }
}


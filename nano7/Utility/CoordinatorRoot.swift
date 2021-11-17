//
//  CoordinatorRoot.swift
//  nano7
//
//  Created by Layla Emanuele on 17/11/21.
//

import UIKit

public protocol CoordinatorRoot: AnyObject {
    //    var navigationController: UINavigationController { get set }
    //    var parentCoordinator: Coordinator? { get set }
    
    func start()
    //    func start(coordinator: Coordinator)
    //    func didFinish(coordinator: Coordinator)
}

//
//  MainCoordinator.swift
//  nano7
//
//  Created by Layla Emanuele on 17/11/21.
//

import UIKit

final class MainCoordinator: CoordinatorSPM {
    
    let window: UIWindow
    let presenter: UINavigationController
    var loginCoodinator: LoginCoordinator?
    var registerCoordinator: RegisterCoordinator?
    var homeCoordinator: FlowCoordinator?
    var coordinator: AnyObject?
    
    init(window: UIWindow) {
        self.window = window
        presenter = UINavigationController()
        self.window.rootViewController = presenter
    }
    
    func start() {
        let loginCoodinator = LoginCoordinator(window: window, delegate: self)
        loginCoodinator.start()
        self.loginCoodinator = loginCoodinator
    }
}


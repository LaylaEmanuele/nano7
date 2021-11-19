//
//  Coordinator.swift
//  nano7
//
//  Created by Layla Emanuele on 17/11/21.
//

import UIKit

enum Event{
    case buttonTapped
    case finishButtonPressed
}

protocol Coordinator{
    var navigationController: UINavigationController? {get set}
    var children: [Coordinator]? {get set}
    
    func eventOcurred(with type: Event)
    func start()
}

protocol Coordinating{
    var coordinater: Coordinator? {get set}
}

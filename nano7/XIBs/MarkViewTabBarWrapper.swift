//
//  MarkViewTabBar.swift
//  nano7
//
//  Created by Rafael Basso on 18/11/21.
//

import UIKit

class MarkViewTabBarWrapper {
    
    public let nib: MarkViewTabBarViewController?
    
    private let MAX_PIN_QNT = 20
    
    private var pinQuantity = 0
    
    init(owner viewController: UIViewController, target view: UIView) {
        
        nib = Bundle.main.loadNibNamed("MarkViewTabBar",
                                            owner: viewController,
                                            options: nil)?.first as? MarkViewTabBarViewController ?? nil
        
        if let myNib = nib {
            view.addSubview(myNib)
            
            // Constraint: height = 128
            let constraint_height = NSLayoutConstraint(item: myNib, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 128)
            
            myNib.addConstraint(constraint_height)
            
            if let subView = viewController.view {
                
                // Constraint: leading = 0 to viewController.view.leadingAnchor
                let constraint_leading = NSLayoutConstraint(item: myNib, attribute: .leading, relatedBy: .equal, toItem: subView, attribute: .leading, multiplier: 1, constant: 0)
                // Constraint: trailing = 0 to viewController.view.trailingAnchor
                let constraint_trailing = NSLayoutConstraint(item: myNib, attribute: .trailing, relatedBy: .equal, toItem: subView, attribute: .trailing, multiplier: 1, constant: 0)
                // Constraint: top = 0 to viewController.view.topAnchor
                let constraint_top = NSLayoutConstraint(item: myNib, attribute: .top, relatedBy: .equal, toItem: subView, attribute: .top, multiplier: 1, constant: 0)
                
                subView.addConstraint(constraint_leading)
                subView.addConstraint(constraint_trailing)
                subView.addConstraint(constraint_top)
            
            }
        }
    }
    
    
    public func addConstraints(_ constraints: [NSLayoutConstraint]) {
        nib?.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension MarkViewTabBarWrapper {
    
    public func increasePinCount() {
        if pinQuantity < MAX_PIN_QNT {
            pinQuantity += 1
            updatePinLabel()
        } else {
            print("Maximum pin quantity already reached!")
        }
    }
    
    public func decreasePinCount() {
        if pinQuantity > 0 {
            pinQuantity -= 1
            updatePinLabel()
        } else {
            print("Minimum pin quantity already reached!")
        }
    }
    
    private func updatePinLabel() {
        nib?.qntLabel.text = "\(pinQuantity)/\(MAX_PIN_QNT)"
    }
    
}

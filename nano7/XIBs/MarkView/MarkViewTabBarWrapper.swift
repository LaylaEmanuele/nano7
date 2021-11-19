//
//  MarkViewTabBar.swift
//  nano7
//
//  Created by Rafael Basso on 18/11/21.
//

import UIKit

class MarkViewTabBarWrapper {
    
    public let nib: MarkViewTabBarViewController?
    
    private var barOwner: UIViewController?
    
    private var pinQuantity = 0
    
    public var pinCount: Int {
        pinQuantity
    }
    
    init(owner viewController: UIViewController) {
        
        barOwner = viewController
        
        nib = Bundle.main.loadNibNamed("MarkViewTabBar",
                                            owner: viewController,
                                            options: nil)?.first as? MarkViewTabBarViewController ?? nil
        
        if let myNib = nib {
            
            myNib.tag = 42
            
            if let subView = viewController.view {
                
                subView.addSubview(myNib)
            
                myNib.translatesAutoresizingMaskIntoConstraints = false
                
                // Constraint: height = 148
                let constraint_height = NSLayoutConstraint(item: myNib, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 148)

                myNib.addConstraint(constraint_height)
                
                // Constraint: leading = 0 to viewController.view.leadingAnchor
                let constraint_leading = NSLayoutConstraint(item: myNib, attribute: .leading, relatedBy: .equal, toItem: subView, attribute: .leading, multiplier: 1, constant: 0)
                // Constraint: trailing = 0 to viewController.view.trailingAnchor
                let constraint_trailing = NSLayoutConstraint(item: myNib, attribute: .trailing, relatedBy: .equal, toItem: subView, attribute: .trailing, multiplier: 1, constant: 0)
                // Constraint: top = 0 to viewController.view.topAnchor
                let constraint_bottom = NSLayoutConstraint(item: myNib, attribute: .bottom, relatedBy: .equal, toItem: subView, attribute: .bottom, multiplier: 1, constant: 0)
                
                subView.addConstraint(constraint_leading)
                subView.addConstraint(constraint_trailing)
                subView.addConstraint(constraint_bottom)
                
            }
        }
    }
    
    public func setDelegate(_ delegate: MarkViewTabBarDelegate) {
        nib!.delegate = delegate
    }
    
    public func dismissView() {
        if let viewWithTag = barOwner?.view.viewWithTag(42){
            viewWithTag.removeFromSuperview()
        }
    }
    
}

extension MarkViewTabBarWrapper {
    
    public func increasePinCount() {
        pinQuantity += 1
        updatePinLabel()
    }
    
//    public func decreasePinCount() {
//        if pinQuantity > 0 {
//            pinQuantity -= 1
//            updatePinLabel()
//        } else {
//            print("Minimum pin quantity already reached!")
//        }
//    }
    
    public func clearPinCount() {
        pinQuantity = 0
        updatePinLabel()
    }
    
    private func updatePinLabel() {
        nib?.qntLabel.text = "\(pinQuantity)"
    }
    
}

//
//  ShareViewTabBarWrapper.swift
//  nano7
//
//  Created by Rafael Basso on 18/11/21.
//

import UIKit

class ShareViewTabBarWrapper {
    
    public let nib: ShareViewTabBarViewController?
    
    init(owner viewController: UIViewController) {
        
        nib = Bundle.main.loadNibNamed("ShareViewTabBar",
                                            owner: viewController,
                                            options: nil)?.first as? ShareViewTabBarViewController ?? nil
        
        if let myNib = nib {
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
    
    public func setDelegate(_ delegate: ShareViewTabBarDelegate) {
        nib!.delegate = delegate
    }
    
}

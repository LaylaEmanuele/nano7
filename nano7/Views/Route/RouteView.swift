//
//  RouteView.swift
//  nano7
//
//  Created by Matheus de Sousa Matos on 18/11/21.
//

import Foundation
import UIKit

class RouteView: UIView {
    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Views
    lazy var titleLabel = makeTitleLabel()
    lazy var map = MKMapView()
    
    //MARK: - Layout Setup
    
}
// MARK: - Layout Setup
extension MapView {
    private func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.text = "TROCOU"
        return label
    }
    
    private func addViews() {
        //addSubview(titleLabel)
        addSubview(map)
    }
    
    //MARK: - Add Constraints
    private func addConstraints() {
        //titleAutoLayout()
        mapAutoLayout()
    }
    
}

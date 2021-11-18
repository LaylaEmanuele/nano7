//
//  MapView.swift
//  nano7
//
//  Created by Layla Emanuele on 17/11/21.
//

import UIKit
import MapKit
import CoreLocation

class MapView: UIView {
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
    
    func titleAutoLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -300).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 87).isActive = true
    }
    
    func mapAutoLayout() {
        map.translatesAutoresizingMaskIntoConstraints = false
        map.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        map.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        map.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

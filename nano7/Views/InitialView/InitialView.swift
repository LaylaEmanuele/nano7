//
//  InitialView.swift
//  nano7
//
//  Created by Layla Emanuele on 17/11/21.
//

import UIKit

class InitialView: UIView {
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
    lazy var titleLabel = makeLabel(text: "Let's Walk and Draw")
    lazy var bottomLabel = makeLabel(text: "Let's Go")
    lazy public var button = makeButton()
    lazy var mainImage = makeImage(imageName: "mainImage")
    
    
    //MARK: - Layout Setup
    
}
// MARK: - Layout Setup
extension InitialView {
    private func makeImage(imageName: String) -> UIImageView {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }
    
    private func makeLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "Combo", size: 36.0)
        return label
    }

    private func makeButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "playButton"), for: .normal)
        return button
    }
    
    private func addViews() {
        addSubview(titleLabel)
        addSubview(bottomLabel)
        addSubview(button)
        addSubview(mainImage)
    }
    
    //MARK: - Add Constraints
    private func addConstraints() {
        titleAutoLayout()
        mainImageAutoLayout()
        buttonAutoLayout()
        bottomLabelAutoLayout()
    }
    
    func titleAutoLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: mainImage.topAnchor).isActive = true
    }
    
    func mainImageAutoLayout() {
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        mainImage.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -100).isActive = true
        mainImage.layer.zPosition = -1
    }
    
    func buttonAutoLayout() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 10).isActive = true
        button.centerYAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 100).isActive = true
    }
    
    func bottomLabelAutoLayout() {
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        bottomLabel.centerYAnchor.constraint(equalTo: button.bottomAnchor, constant: 40).isActive = true
    }
    
}

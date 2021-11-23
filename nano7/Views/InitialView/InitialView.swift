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
    lazy var titleImg = makeImage(imageName: "titleImg")
    lazy public var button = makeButton(text: "playButton")
    lazy var mainImage = makeImage(imageName: "mainImg")
    lazy var bgImg = makeImage(imageName: "bgImg")
    lazy var buttonSettings = makeButton(text: "buttonSettings")
    
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
        label.textColor = UIColor(named: "corTexto")
        //label.tintColor = UIColor(named: "corTexto")
        return label
    }

    private func makeButton(text: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: text), for: .normal)
        
        return button
    }
    
    private func addViews() {
        addSubview(titleImg)
        addSubview(mainImage)
        addSubview(button)
        addSubview(bgImg)
        addSubview(buttonSettings)
    }
    
    //MARK: - Add Constraints
    private func addConstraints() {
        titleImgAutoLayout()
        mainImageAutoLayout()
        buttonAutoLayout()
        bgImgeAutoLayout()
        buttonSettingsAutoLayout()
    }
    
    func titleImgAutoLayout() {
        titleImg.translatesAutoresizingMaskIntoConstraints = false
        titleImg.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        titleImg.centerYAnchor.constraint(equalTo: mainImage.topAnchor, constant: -30).isActive = true
    }
    
    func mainImageAutoLayout() {
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        mainImage.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        mainImage.layer.zPosition = -1
    }
    
    func buttonAutoLayout() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: -30).isActive = true
    }
    
    func bgImgeAutoLayout() {
        bgImg.translatesAutoresizingMaskIntoConstraints = false
        bgImg.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bgImg.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bgImg.layer.zPosition = -2
    }
    
    func buttonSettingsAutoLayout() {
        buttonSettings.translatesAutoresizingMaskIntoConstraints = false
        buttonSettings.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        buttonSettings.topAnchor.constraint(equalTo: self.topAnchor, constant: 70).isActive = true
    }
}

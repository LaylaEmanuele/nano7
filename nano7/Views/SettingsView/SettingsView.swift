//
//  SettingsView.swift
//  nano7
//
//  Created by Layla Emanuele on 22/11/21.
//

import UIKit

class SettingsView: UIView {
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
    private var titleAbout: UILabel = {
        let label = UILabel()
        label.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 50))
        let text = "About"
        label.text = text
        label.textColor = UIColor(named: "colorLabelAboutApp")
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        // Define attributes
        let labelFont = UIFont(name: "SF Pro Display", size: 17)
        let attributes :Dictionary = [NSAttributedString.Key.font : labelFont]
        
        return label
    }()
    
    private let descProject: UILabel = {
        let label = UILabel()
        label.frame = CGRect(origin: .zero, size: CGSize(width: 120, height: 50))
        let text = "This Application was developed by students of the Project Developer's Academy of the Catholic University of Brasília (UCB)."
        label.text = text
        
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "SF Pro Display", size: 13)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = CGFloat(25)
        paragraphStyle.lineBreakStrategy = .standard
        label.attributedText = NSAttributedString(
            string: text,
            attributes: [
                .paragraphStyle : paragraphStyle
            ])
        label.numberOfLines = 0
        
        return label
    }()
    
    private var titleDesign: UILabel = {
        let label = UILabel()
        label.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 50))
        let text = "Design"
        label.text = text
        label.textColor = UIColor(named: "colorLabelAboutApp")
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        // Define attributes
        let labelFont = UIFont(name: "SF Pro Display", size: 17)
        let attributes :Dictionary = [NSAttributedString.Key.font : labelFont]
        
        return label
    }()
    
    private var nameDesing: UILabel = {
        let label = UILabel()
        label.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 50))
        label.textColor = .black
        label.textAlignment = .center
        
        // Define attributes
        let attributedString = NSMutableAttributedString.init(string: "Asset rights reserved at https://storyset.com/")
        
        label.attributedText = attributedString
        
        return label
    }()
    
    private var titleCode: UILabel = {
        let label = UILabel()
        label.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 50))
        let text = "Coders"
        label.text = text
        label.textColor = UIColor(named: "colorLabelAboutApp")
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        // Define attributes
        let labelFont = UIFont(name: "SF Pro Display", size: 17)
        let attributes :Dictionary = [NSAttributedString.Key.font : labelFont]
        
        return label
    }()
    
    private var nameCoder1: UILabel = {
        let label = UILabel()
        label.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 50))
        label.textColor = .black
        label.textAlignment = .center
        
        // Define attributes
        let labelFont = UIFont(name: "SF Pro Display", size: 17)
        
        let attributedString = NSMutableAttributedString.init(string: "Layla Emanuele")
        
        label.attributedText = attributedString
        
        return label
    }()
    
    private var nameCoder2: UILabel = {
        let label = UILabel()
        label.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 50))
        label.textColor = .black
        label.textAlignment = .center
        
        // Define attributes
        let labelFont = UIFont(name: "SF Pro Display", size: 17)
        
        let attributedString = NSMutableAttributedString.init(string: "Matheus Matos")
        
        label.attributedText = attributedString
        
        return label
    }()
    
    private var nameCoder3: UILabel = {
        let label = UILabel()
        label.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 50))
        label.textColor = .black
        label.textAlignment = .center
        
        // Define attributes
        let labelFont = UIFont(name: "SF Pro Display", size: 17)
        
        let attributedString = NSMutableAttributedString.init(string: "Paulo César")
        
        label.attributedText = attributedString
        
        return label
    }()
    
    private var nameCoder4: UILabel = {
        let label = UILabel()
        label.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 50))
        label.textColor = .black
        label.textAlignment = .center
        
        // Define attributes
        let labelFont = UIFont(name: "SF Pro Display", size: 17)
        
        let attributedString = NSMutableAttributedString.init(string: "Philippe de Paula")
        
        label.attributedText = attributedString
        
        return label
    }()
    
    private var nameCoder5: UILabel = {
        let label = UILabel()
        label.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 50))
        label.textColor = .black
        label.textAlignment = .center

        // Define attributes
        let labelFont = UIFont(name: "SF Pro Display", size: 17)

        let attributedString = NSMutableAttributedString.init(string: "Rafael Basso")

        label.attributedText = attributedString

        return label
    }()
    
    //MARK: - Layout Setup
    
}
// MARK: - Layout Setup
extension SettingsView {
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
        addSubview(titleAbout)
        addSubview(descProject)
        addSubview(titleDesign)
        addSubview(nameDesing)
        addSubview(titleCode)
        addSubview(nameCoder1)
        addSubview(nameCoder2)
        addSubview(nameCoder3)
        addSubview(nameCoder4)
        addSubview(nameCoder5)
        addConstraints()
    }
    
    //MARK: - Add Constraints
    func addConstraints() {
        addSubview(titleAbout)
        titleAboutAutoLayout()
        
        addSubview(descProject)
        descProjectAutoLayout()
        
        addSubview(titleDesign)
        titleDesingAutoLayout()
        
        addSubview(nameDesing)
        nameDesingAutoLayout()
        
        addSubview(titleCode)
        titleCodeAutoLayout()
        
        addSubview(nameCoder1)
        nameCodersAutoLayout(nameCoder: nameCoder1, const: -10)
        
        addSubview(nameCoder2)
        nameCodersAutoLayout(nameCoder: nameCoder2, const: 25)
        
        addSubview(nameCoder3)
        nameCodersAutoLayout(nameCoder: nameCoder3, const: 60)
        
        addSubview(nameCoder4)
        nameCodersAutoLayout(nameCoder: nameCoder4, const: 95)
        
        addSubview(nameCoder5)
        nameCodersAutoLayout(nameCoder: nameCoder5, const: 130)
    }
    
    func titleAboutAutoLayout() {
        titleAbout.translatesAutoresizingMaskIntoConstraints = false
        titleAbout.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        titleAbout.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -330).isActive = true
        titleAbout.heightAnchor.constraint(equalToConstant: 75).isActive = true
        titleAbout.widthAnchor.constraint(equalToConstant: 87).isActive = true
    }
    
    func descProjectAutoLayout() {
        descProject.translatesAutoresizingMaskIntoConstraints = false
        descProject.bottomAnchor.constraint(equalTo: titleAbout.bottomAnchor, constant: 50).isActive = true
        descProject.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        descProject.leadingAnchor.constraint(equalTo: titleAbout.leadingAnchor, constant: 20).isActive = true
        descProject.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func titleDesingAutoLayout() {
        titleDesign.translatesAutoresizingMaskIntoConstraints = false
        titleDesign.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 85).isActive = true
        titleDesign.topAnchor.constraint(equalTo: descProject.bottomAnchor).isActive = true
        titleDesign.heightAnchor.constraint(equalToConstant: 75).isActive = true
        titleDesign.widthAnchor.constraint(equalToConstant: 87).isActive = true
    }
    
    func nameDesingAutoLayout() {
        nameDesing.translatesAutoresizingMaskIntoConstraints = false
        nameDesing.leadingAnchor.constraint(equalTo: titleAbout.leadingAnchor, constant: 20).isActive = true
        nameDesing.topAnchor.constraint(equalTo: titleDesign.bottomAnchor, constant: -10).isActive = true
        
    }
    
    func titleCodeAutoLayout() {
        titleCode.translatesAutoresizingMaskIntoConstraints = false
        titleCode.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 85).isActive = true
        titleCode.topAnchor.constraint(equalTo: nameDesing.bottomAnchor).isActive = true
        titleCode.heightAnchor.constraint(equalToConstant: 75).isActive = true
        titleCode.widthAnchor.constraint(equalToConstant: 87).isActive = true
    }
    
    func nameCodersAutoLayout(nameCoder: UILabel, const: Double) {
        nameCoder.translatesAutoresizingMaskIntoConstraints = false
        nameCoder.topAnchor.constraint(equalTo: titleCode.bottomAnchor, constant: const).isActive = true
        nameCoder.leadingAnchor.constraint(equalTo: titleAbout.leadingAnchor, constant: 20).isActive = true
    }
}

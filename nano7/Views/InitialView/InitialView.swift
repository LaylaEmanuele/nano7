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
    lazy var titleLabel = makeTitleLabel()
    lazy public var button = makeButton()
    
    //MARK: - Layout Setup
    
}
// MARK: - Layout Setup
extension InitialView {
    private func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.text = "Let's walk and Draw"
        return label
    }

    private func makeButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
        button.backgroundColor = .systemCyan
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Tap Me!", for: .normal)
        return button
    }
    
    private func addViews() {
        addSubview(titleLabel)
        addSubview(button)
    }
    
    //MARK: - Add Constraints
    private func addConstraints() {
        titleAutoLayout()
        buttonAutoLayout()
    }
    func buttonAutoLayout() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        button.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -300).isActive = true
        button.heightAnchor.constraint(equalToConstant: 75).isActive = true
        button.widthAnchor.constraint(equalToConstant: 87).isActive = true
    }
    func titleAutoLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -300).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 87).isActive = true
    }
    
    
}

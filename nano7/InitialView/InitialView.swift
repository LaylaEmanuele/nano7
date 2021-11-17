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
    
    //MARK: - Layout Setup
    
}
// MARK: - Layout Setup
extension InitialView {
    private func makeTitleLabel() -> UILabel {
        var label = UILabel()
        label.text = "Let's walk and Draw"
        return label
    }

    private func addViews() {
        addSubview(titleLabel)
    }
    
    //MARK: - Add Constraints
    private func addConstraints() {
        titleAutoLayout()
    }
    
    func titleAutoLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -300).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 87).isActive = true
    }
}

//
//  ShareViewTabBarController.swift
//  nano7
//
//  Created by Rafael Basso on 18/11/21.
//

import UIKit

class ShareViewTabBarViewController: UIView {
    
    public var delegate: ShareViewTabBarDelegate?
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        print("Voltar!")
        delegate?.backButtonPresesd()
    }
    
    @IBAction func downloadButtonPressed(_ sender: UIButton) {
        print("Baixar!")
        delegate?.downloadButtonPressed()
    }
    
    @IBAction func shareButtonPressed(_ sender: UIButton) {
        print("Compartilhar!")
        delegate?.shareButtonPressed()
    }
    
}

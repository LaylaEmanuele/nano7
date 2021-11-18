//
//  MarkViewTabBarViewController.swift
//  nano7
//
//  Created by Rafael Basso on 18/11/21.
//

import UIKit

class MarkViewTabBarViewController: UIView {
    
    public var delegate: MarkViewTabBarDelegate?
    
    @IBOutlet weak var qntLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func finishButton(_ sender: UIButton) {
        
        delegate?.finishButtonPressed()
        
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        
        delegate?.clearButtonPressed()
        
    }
}

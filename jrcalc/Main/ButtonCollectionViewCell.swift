//
//  ButtonCollectionViewCell.swift
//  jrcalc
//
//  Created by Юлия on 25.10.2018.
//  Copyright © 2018 Юлия. All rights reserved.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var buttonView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        buttonView.frame = bounds
    }
    
    public func setColor(color: UIColor) {
        buttonView.backgroundColor = color
    }
    

}

//
//  ScreenView.swift
//  jrcalc
//
//  Created by Юлия on 21.10.2018.
//  Copyright © 2018 Юлия. All rights reserved.
//

import UIKit

class ScreenView: UIView {
    
    @IBOutlet private weak var memSign: UILabel!
    @IBOutlet private weak var bracketsSign: UILabel!
    @IBOutlet private weak var firstNumberLabel: UILabel!
    @IBOutlet private weak var secondNumberLabel: UILabel!
    
    private var offsetX: CGFloat = 0.0
    private var offsetY: CGFloat = 0.0

    
    func setOffset(ofX: CGFloat, ofY: CGFloat){
        offsetX = ofX
        offsetY = ofY
    }
    
    override func layoutSubviews() {
        let height = bounds.height - Const.elementOffset*3
        let width = bounds.width - offsetX - Const.elementOffset*3
        bracketsSign.frame = CGRect.init(x: Const.elementOffset+offsetX,
                                         y: Const.elementOffset,
                                         width: Const.signWidgh,
                                         height: offsetY)
        
        memSign.frame = CGRect.init(x: Const.elementOffset+offsetX+Const.signWidgh,
                                    y: Const.elementOffset,
                                    width: Const.signWidgh,
                                    height: offsetY)
        
        secondNumberLabel.frame = CGRect.init(x: Const.elementOffset+offsetX+Const.signWidgh*2,
                                              y: Const.elementOffset,
                                              width: width - Const.signWidgh*2,
                                              height: offsetY)
        
        firstNumberLabel.frame = CGRect(x: bounds.origin.x + Const.elementOffset,
                                        y: bounds.origin.y + Const.elementOffset*2 + offsetY,
                                        width: bounds.width - Const.elementOffset*2,
                                        height: height - offsetY)
    }

}


//
//  HeaderButton.swift
//  jrcalc
//
//  Created by Radislav Gaynanov on 18/11/2018.
//  Copyright © 2018 Юлия. All rights reserved.
//

import UIKit

class HeaderButton: UIButton {
    enum typeButton {
        case share, trash
    }
    
    private var type: typeButton
    
    init(type: typeButton) {
        self.type = type
        super.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        type = .share
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setType(type: typeButton){
        self.type = type
    }
    
    override func draw(_ rect: CGRect) {
        let w = rect.width
        let h = rect.height
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.setLineWidth(1.0)
        switch type {
        case .share:
            //Box
            context?.stroke(CGRect(x: w * 0.16, y: h * 0.3, width: w * 0.69, height: h * 0.69))
            context?.setFillColor(UIColor.white.cgColor)
            context?.fill(CGRect(x: w * 0.4, y: 0, width: w * 0.2, height: h * 0.5))
            //Arrow
            context?.move(to: CGPoint(x: w * 0.5, y: h * 0.02))
            context?.addLine(to: CGPoint(x: w * 0.5, y: h * 0.64))
            context?.move(to: CGPoint(x: w * 0.33, y: h * 0.19))
            context?.addLine(to: CGPoint(x: w * 0.5, y: h * 0.02))
            context?.addLine(to: CGPoint(x: w * 0.67, y: h * 0.19))
            context?.strokePath()
        case .trash:
            context?.move(to: CGPoint(x: w * 0.1, y: h * 0.15))
            context?.addLine(to: CGPoint(x: w * 0.9, y: h * 0.15))
            //Can
            context?.move(to: CGPoint(x: w * 0.2, y: h * 0.15))
            context?.addArc(tangent1End: CGPoint(x: w * 0.25, y: h * 0.95), tangent2End: CGPoint(x: w * 0.5, y:h * 0.95), radius: CGFloat(2.0))
            
            context?.addArc(tangent1End: CGPoint(x: w * 0.75, y: h * 0.95), tangent2End: CGPoint(x: w * 0.8, y: h * 0.15), radius: CGFloat(2.0))
            context?.addLine(to: CGPoint(x: w * 0.8, y: h * 0.15))
            // Handle
            context?.move(to: CGPoint(x: w * 0.34, y: h * 0.15))
            context?.addArc(tangent1End: CGPoint(x: w * 0.34, y: h * 0.02), tangent2End: CGPoint(x: w * 0.5, y: h * 0.02), radius: CGFloat(2.0))
            context?.addArc(tangent1End: CGPoint(x: w * 0.66, y : h * 0.02), tangent2End: CGPoint(x: w * 0.66, y: h * 0.15), radius: CGFloat(2.0))
            context?.addLine(to: CGPoint(x: w * 0.66, y: h * 0.15))
            //Lines
            context?.move(to: CGPoint(x: w * 0.35, y: h * 0.25))
            context?.addLine(to: CGPoint(x: w * 0.38, y: h * 0.8))
            context?.move(to: CGPoint(x: w * 0.5, y: h * 0.25))
            context?.addLine(to: CGPoint(x: w * 0.5, y: h * 0.8))
            context?.move(to: CGPoint(x: w * 0.65, y: h * 0.25))
            context?.addLine(to: CGPoint(x: w * 0.62, y: h*0.8))
        }
        context?.strokePath()
    
    }
    

}

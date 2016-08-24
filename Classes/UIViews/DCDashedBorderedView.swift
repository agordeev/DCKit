//
//  DCDashedBorderedView.swift
//  DCKitSample
//
//  Created by Andrey Gordeev on 5/10/15.
//  Copyright (c) 2015 Andrey Gordeev. All rights reserved.
//

import UIKit

@IBDesignable
open class DCDashedBorderedView: DCBaseView {
    
    @IBInspectable open var borderColor: UIColor = UIColor.lightGray {
        didSet {
            borderLayer.strokeColor = borderColor.cgColor
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 1.0 {
        didSet {
            borderLayer.lineWidth = borderWidth / UIScreen.main.scale
        }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = 0.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable open var dashLength: CGFloat = 4.0 {
        didSet {
            borderLayer.lineDashPattern = [NSNumber(value: Float(dashLength)), NSNumber(value: Float(dashSpace))]
        }
    }
    
    @IBInspectable open var dashSpace: CGFloat = 2.0 {
        didSet {
            borderLayer.lineDashPattern = [NSNumber(value: Float(dashLength)), NSNumber(value: Float(dashSpace))]
        }
    }

    let borderLayer = CAShapeLayer()
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        borderLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        borderLayer.frame = bounds
    }
    
    // MARK: - Build control
    
    override open func customInit() {
        super.customInit()
        
        addBorder()
    }
    
    open func addBorder() {
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.lineDashPattern = [NSNumber(value: Float(dashLength)), NSNumber(value: Float(dashSpace))]
        borderLayer.lineWidth = borderWidth / UIScreen.main.scale
        
        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        borderLayer.masksToBounds = true
        borderLayer.rasterizationScale = UIScreen.main.scale
        borderLayer.shouldRasterize = true
        
        layer.addSublayer(borderLayer)
    }

}

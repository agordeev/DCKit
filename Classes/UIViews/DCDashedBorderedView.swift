//
//  DCDashedBorderedView.swift
//  DCKitSample
//
//  Created by Andrey Gordeev on 5/10/15.
//  Copyright (c) 2015 Andrey Gordeev. All rights reserved.
//

import UIKit

@IBDesignable
public class DCDashedBorderedView: DCBaseView {
    
    @IBInspectable public var borderColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            borderLayer.strokeColor = borderColor.CGColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 1.0 {
        didSet {
            borderLayer.lineWidth = borderWidth / UIScreen.mainScreen().scale
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var dashLength: CGFloat = 4.0 {
        didSet {
            borderLayer.lineDashPattern = [dashLength, dashSpace]
        }
    }
    
    @IBInspectable public var dashSpace: CGFloat = 2.0 {
        didSet {
            borderLayer.lineDashPattern = [dashLength, dashSpace]
        }
    }

    let borderLayer = CAShapeLayer()
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        borderLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).CGPath
        borderLayer.frame = bounds
    }
    
    // MARK: - Build control
    
    override public func customInit() {
        super.customInit()
        
        addBorder()
    }
    
    public func addBorder() {
        borderLayer.strokeColor = borderColor.CGColor
        borderLayer.fillColor = UIColor.clearColor().CGColor
        borderLayer.lineDashPattern = [dashLength, dashSpace]
        borderLayer.lineWidth = borderWidth / UIScreen.mainScreen().scale
        
        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        borderLayer.masksToBounds = true
        borderLayer.rasterizationScale = UIScreen.mainScreen().scale
        borderLayer.shouldRasterize = true
        
        layer.addSublayer(borderLayer)
    }

}

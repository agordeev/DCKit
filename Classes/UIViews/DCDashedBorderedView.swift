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
    
    @IBInspectable public var borderColor: UIColor = UIColor.lightGray {
        didSet {
            borderLayer.strokeColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 1.0 {
        didSet {
            borderLayer.lineWidth = borderWidth / UIScreen.main.scale
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable public var dashLength: CGFloat = 4.0 {
        didSet {
            borderLayer.lineDashPattern = [NSNumber(value: Float(dashLength)), NSNumber(value: Float(dashSpace))]
        }
    }
    
    @IBInspectable public var dashSpace: CGFloat = 2.0 {
        didSet {
            borderLayer.lineDashPattern = [NSNumber(value: Float(dashLength)), NSNumber(value: Float(dashSpace))]
        }
    }

    let borderLayer = CAShapeLayer()
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        borderLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        borderLayer.frame = bounds
    }
    
    // MARK: - Build control
    
    override public func customInit() {
        super.customInit()
        
        addBorder()
    }
    
    public func addBorder() {
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

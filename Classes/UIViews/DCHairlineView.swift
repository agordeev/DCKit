//
//  HairlineView.swift
//  DCKit
//
//  Created by Andrey Gordeev on 28/12/14.
//  Copyright (c) 2014 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// This view can be used as a thin/thick separator line between views.
@IBDesignable
public class DCHairlineView: UIView {
    
    /// A color of the line. Don't use background color.
    @IBInspectable public var color: UIColor = UIColor.black
    
    /// A width/height of the line.
    @IBInspectable public var width: CGFloat = 1.0
    
    /// True if we want to draw the horizontal line. False for vertical line.
    @IBInspectable public var horizontal: Bool = true
    
    // MARK: - Life cycle
    
    public override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        if horizontal {
            context?.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            context?.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        }
        else {
            context?.move(to: CGPoint(x: rect.minX, y: rect.minY))
            context?.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
        context?.setStrokeColor(color.cgColor )
        context?.setLineWidth(width / UIScreen.main.scale)
        context?.strokePath()
    }

}

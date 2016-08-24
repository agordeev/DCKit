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
open class DCHairlineView: UIView {

    /// A color of the line. Don't use background color.
    @IBInspectable open var color: UIColor = UIColor.black

    /// A width/height of the line.
    @IBInspectable open var width: CGFloat = 1.0

    /// True if we want to draw the horizontal line. False for vertical line.
    @IBInspectable open var horizontal: Bool = true

    // MARK: - Life cycle

    open override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        if horizontal {
            context?.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            context?.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        } else {
            context?.move(to: CGPoint(x: rect.minX, y: rect.minY))
            context?.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
        context?.setStrokeColor(color.cgColor )
        context?.setLineWidth(width / UIScreen.main.scale)
        context?.strokePath()
    }

}

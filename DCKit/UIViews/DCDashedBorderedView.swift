//
//  DCDashedBorderedView.swift
//  DCKitSample
//
//  Created by Andrey Gordeev on 5/10/15.
//  Copyright (c) 2015 Andrey Gordeev. All rights reserved.
//

import UIKit

/// UIView with dashed border.
@IBDesignable open class DCDashedBorderedView: DCBaseView {

    /// The control's border color.
    @IBInspectable open var borderColor: UIColor = UIColor.lightGray {
        didSet {
            borderLayer.strokeColor = borderColor.cgColor
        }
    }

    /// The control's border width. Gets automatically scaled with using UIScreen.main.scale.
    @IBInspectable open var borderWidth: CGFloat = 1.0 {
        didSet {
            borderLayer.lineWidth = borderWidth / UIScreen.main.scale
        }
    }

    /// The control's corner radius.
    @IBInspectable open var cornerRadius: CGFloat = 0.0 {
        didSet {
            layoutSubviews()
        }
    }

    /// Dash length (in points).
    @IBInspectable open var dashLength: CGFloat = 4.0 {
        didSet {
            borderLayer.lineDashPattern = [NSNumber(value: Float(dashLength)), NSNumber(value: Float(dashSpace))]
        }
    }

    /// Space between two dashes (in points).
    @IBInspectable open var dashSpace: CGFloat = 2.0 {
        didSet {
            borderLayer.lineDashPattern = [NSNumber(value: Float(dashLength)), NSNumber(value: Float(dashSpace))]
        }
    }

    // MARK: - Initializers

    // IBDesignables require both of these inits, otherwise we'll get an error: IBDesignable View Rendering times out.
    // http://stackoverflow.com/questions/26772729/ibdesignable-view-rendering-times-out

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /// A layer, where we actually draw a dashed border.
    private let borderLayer = CAShapeLayer()

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

    /// Adds a dashed border to the control.
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

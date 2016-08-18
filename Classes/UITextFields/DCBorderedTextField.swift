//
//  BorderedTextField.swift
//  DCKit
//
//  Created by Andrey Gordeev on 02/03/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

@IBDesignable
public class DCBorderedTextField: DCBaseTextField {

    @IBInspectable
    public var normalBorderColor: UIColor = UIColor.lightGray {
        didSet {
            layer.borderColor = normalBorderColor.cgColor
        }
    }

    @IBInspectable
    public var cornerRadius: CGFloat = 6.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable
    public var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth / UIScreen.main.scale
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

    // MARK: - Build text field

    override public func customInit() {
        super.customInit()

        borderStyle = UITextBorderStyle.none
        cornerRadius = 6.0
        borderWidth = 1.0

        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }

    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(bounds)
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(bounds)
    }

    // MARK: - Misc

    /// We use this internal func in textRectForBounds, editingRectForBounds etc. to adjust an actual rectangle according to applied corner radius
    private func textRect(_ bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: cornerRadius, dy: 0)
    }

}

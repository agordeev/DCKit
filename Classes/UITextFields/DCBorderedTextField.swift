//
//  BorderedTextField.swift
//  DCKit
//
//  Created by Andrey Gordeev on 02/03/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

@IBDesignable
open class DCBorderedTextField: DCBaseTextField {

    @IBInspectable
    open var normalBorderColor: UIColor = UIColor.lightGray {
        didSet {
            layer.borderColor = normalBorderColor.cgColor
        }
    }

    @IBInspectable
    open var cornerRadius: CGFloat = 6.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable
    open var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth / UIScreen.main.scale
        }
    }

    // MARK: - Build text field

    override open func customInit() {
        super.customInit()

        borderStyle = UITextBorderStyle.none
        cornerRadius = 6.0
        borderWidth = 1.0

        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(bounds)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(bounds)
    }

    // MARK: - Misc

    /// We use this internal func in textRectForBounds, editingRectForBounds etc. to adjust an actual rectangle according to applied corner radius
    private func textRect(_ bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: cornerRadius, dy: 0)
    }

}

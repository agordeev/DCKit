//
//  BorderedTextField.swift
//  DCKit
//
//  Created by Andrey Gordeev on 02/03/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// Text field with the ability to set a border with a corner.
@IBDesignable open class DCBorderedTextField: DCBaseTextField {

    /// Border color for Normal state.
    @IBInspectable open var normalBorderColor: UIColor = UIColor.lightGray {
        didSet {
            layer.borderColor = normalBorderColor.cgColor
        }
    }

    /// The control's corner radius.
    @IBInspectable open var cornerRadius: CGFloat = 6.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    /// The control's border width. Gets automatically scaled with using UIScreen.main.scale.
    @IBInspectable open var borderWidth: CGFloat = 1.0 {
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
        if clearButtonMode == .always {
            // rightPadding adds more space for Clear button.
            return textRect(bounds, rightPadding: clearButtonRect(forBounds: bounds).width)
        } else {
            return textRect(bounds)
        }
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        if clearButtonMode == .never || clearButtonMode == .unlessEditing {
            return textRect(bounds)
        } else {
            return textRect(bounds, rightPadding: clearButtonRect(forBounds: bounds).width)
        }
    }

    // MARK: - Misc

    /**
     We use this internal func in `textRectForBounds(_:)`, `editingRectForBounds(_:)` etc. to adjust an actual rectangle according to applied corner radius.

     - parameter bounds: Bounds of the text field coming from `textRectForBounds(_:)`, `editingRectForBounds(_:)`.
     - parameter rightPadding: If Clear button is present, we want to have a padding from the right, so text doesn't overlap with Clear button.

     - returns: Adjusted bounds according to corner radius and rightPadding value.
     */
    private func textRect(_ bounds: CGRect, rightPadding: CGFloat = 0) -> CGRect {
        var editingRect = bounds.insetBy(dx: cornerRadius, dy: 0)
        editingRect.size = CGSize(width: editingRect.width - rightPadding, height: editingRect.height)
        return editingRect
    }

}

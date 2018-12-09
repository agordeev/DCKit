//
//  BorderedButton.swift
//  Socium
//
//  Created by Andrey Gordeev on 27/12/14.
//  Copyright (c) 2014 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// Button class with the ability to set a border with a corner.
@IBDesignable open class DCBorderedButton: DCBaseButton {

    override open var isEnabled: Bool {
        didSet {
            updateColor()
        }
    }

    /// Border color for Normal state.
    @IBInspectable open var normalBorderColor: UIColor = UIColor.lightGray {
        didSet {
            updateColor()
        }
    }

    /// Border color for Disabled state.
    @IBInspectable open var disabledBorderColor: UIColor = UIColor.lightGray {
        didSet {
            updateColor()
        }
    }

    /// Border color for Selected state.
    @IBInspectable open var selectedBorderColor: UIColor = UIColor(red: 37.0/255.0, green: 147.0/255.0, blue: 1.0/255.0, alpha: 1.0) {
        didSet {
            updateColor()
        }
    }

    /// The control's corner radius.
    @IBInspectable open var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
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

    // MARK: - Build control

    override open func customInit() {
        super.customInit()

        addBorder()
    }

    /// Adds a border to the button.
    open func addBorder() {
        layer.borderColor = normalBorderColor.cgColor
        borderWidth = 1.0

        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }

    // MARK: - Misc

    override open func updateColor() {
        super.updateColor()

        layer.borderColor = isEnabled ? (isSelected ? selectedBorderColor.cgColor : normalBorderColor.cgColor) : disabledBorderColor.cgColor
    }

}

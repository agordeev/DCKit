//
//  DCBaseButton.swift
//  DCKit
//
//  Created by Andrey Gordeev on 27/12/14.
//  Copyright (c) 2014 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// A base button class.
@IBDesignable public class DCBaseButton: UIButton {

    /// Text color for Normal state.
    @IBInspectable public var normalTextColor: UIColor = UIColor.lightGray {
        didSet {
            setTitleColor(normalTextColor, for: UIControlState())
        }
    }

    /// Text color for Disabled state.
    @IBInspectable public var disabledTextColor: UIColor = UIColor.lightGray {
        didSet {
            setTitleColor(disabledTextColor, for: UIControlState.disabled)
        }
    }

    /// Text color for Selected state.
    @IBInspectable public var selectedTextColor: UIColor = UIColor.lightGray {
        didSet {
            setTitleColor(selectedTextColor, for: UIControlState.selected)
        }
    }

    /// Text color for Highlighted state.
    @IBInspectable public var highlightedTextColor: UIColor = UIColor.lightGray {
        didSet {
            setTitleColor(highlightedTextColor, for: UIControlState.highlighted)
        }
    }

    /// Text color for Normal state.
    @IBInspectable public var normalBackgroundColor: UIColor = UIColor.white {
        didSet {
            updateColor()
        }
    }

    /// Text color for Disabled state.
    @IBInspectable public var disabledBackgroundColor: UIColor = UIColor.white {
        didSet {
            updateColor()
        }
    }

    /// Text color for Selected state.
    @IBInspectable public var selectedBackgroundColor: UIColor = UIColor(red: 37.0/255.0, green: 147.0/255.0, blue: 1.0/255.0, alpha: 1.0) {
        didSet {
            updateColor()
        }
    }

    override public var isEnabled: Bool {
        didSet {
            updateColor()
        }
    }

    override public var isSelected: Bool {
        didSet {
            updateColor()
        }
    }

    // MARK: - Initializers

    override public init(frame: CGRect) {
        super.init(frame: frame)

        customInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        customInit()
    }

    // MARK: - Build control

    /// Overriden method must call super.customInit().
    public func customInit() {
        configureFont()
        configureColor()
    }

    /// Configures control's font.
    public func configureFont() {
    }

    /// Configures control's color.
    public func configureColor() {
    }

    // MARK: - Misc

    /// Updates button's background color. Gets called after any of [state]BackgroundColor property was changed.
    public func updateColor() {
        backgroundColor = isEnabled ? (isSelected ? selectedBackgroundColor : normalBackgroundColor) : disabledBackgroundColor
    }

}

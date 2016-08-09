//
//  DCBaseButton.swift
//  DCKit
//
//  Created by Andrey Gordeev on 27/12/14.
//  Copyright (c) 2014 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

@IBDesignable
public class DCBaseButton: UIButton {
    
    @IBInspectable public var normalTextColor: UIColor = UIColor.lightGray {
        didSet {
            setTitleColor(normalTextColor, for: UIControlState())
        }
    }
    
    @IBInspectable public var disabledTextColor: UIColor = UIColor.lightGray {
        didSet {
            setTitleColor(disabledTextColor, for: UIControlState.disabled)
        }
    }
    
    @IBInspectable public var selectedTextColor: UIColor = UIColor.lightGray {
        didSet {
            setTitleColor(selectedTextColor, for: UIControlState.selected)
        }
    }
    
    @IBInspectable public var highlightedTextColor: UIColor = UIColor.lightGray {
        didSet {
            setTitleColor(highlightedTextColor, for: UIControlState.highlighted)
        }
    }
    
    @IBInspectable public var normalBackgroundColor: UIColor = UIColor.white {
        didSet {
            updateColor()
        }
    }
    
    @IBInspectable public var disabledBackgroundColor: UIColor = UIColor.white {
        didSet {
            updateColor()
        }
    }
    
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
    
    public func configureFont() {
    }
    
    public func configureColor() {
    }
    
    // MARK: - Misc
    
    public func updateColor() {
        backgroundColor = isEnabled ? (isSelected ? selectedBackgroundColor : normalBackgroundColor) : disabledBackgroundColor
    }
    
}

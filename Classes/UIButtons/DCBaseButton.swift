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
    
    @IBInspectable public var normalTextColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            setTitleColor(normalTextColor, forState: UIControlState.Normal)
        }
    }
    
    @IBInspectable public var disabledTextColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            setTitleColor(disabledTextColor, forState: UIControlState.Disabled)
        }
    }
    
    @IBInspectable public var selectedTextColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            setTitleColor(selectedTextColor, forState: UIControlState.Selected)
        }
    }
    
    @IBInspectable public var highlightedTextColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            setTitleColor(highlightedTextColor, forState: UIControlState.Highlighted)
        }
    }
    
    @IBInspectable public var normalBackgroundColor: UIColor = UIColor.whiteColor() {
        didSet {
            updateColor()
        }
    }
    
    @IBInspectable public var disabledBackgroundColor: UIColor = UIColor.whiteColor() {
        didSet {
            updateColor()
        }
    }
    
    @IBInspectable public var selectedBackgroundColor: UIColor = UIColor(red: 37.0/255.0, green: 147.0/255.0, blue: 1.0/255.0, alpha: 1.0) {
        didSet {
            updateColor()
        }
    }
    
    override public var enabled: Bool {
        didSet {
            updateColor()
        }
    }
    
    override public var selected: Bool {
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
        backgroundColor = enabled ? (selected ? selectedBackgroundColor : normalBackgroundColor) : disabledBackgroundColor
    }
    
}

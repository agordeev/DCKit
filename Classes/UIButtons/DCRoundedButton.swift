//
//  DCRoundedButton.swift
//  DCKitSample
//
//  Created by Andrey Gordeev on 5/10/15.
//  Copyright (c) 2015 Andrey Gordeev. All rights reserved.
//

import UIKit

@IBDesignable
public class DCRoundedButton: DCBaseButton {
    
    override public var enabled: Bool {
        didSet {
            updateColor()
        }
    }
    
    @IBInspectable public var normalBorderColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            updateColor()
        }
    }
    
    @IBInspectable public var disabledBorderColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            updateColor()
        }
    }
    
    @IBInspectable public var selectedBorderColor: UIColor = UIColor(red: 37.0/255.0, green: 147.0/255.0, blue: 1.0/255.0, alpha: 1.0) {
        didSet {
            updateColor()
        }
    }
    
    // MARK: - Initializers
    
    // IBDesignables require both of these inits, otherwise we'll get an error: IBDesignable View Rendering times out.
    // http://stackoverflow.com/questions/26772729/ibdesignable-view-rendering-times-out
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Build control
    
    override public func customInit() {
        super.customInit()
        
        addBorder()
    }
    
    public func addBorder() {
        layer.borderColor = normalBorderColor.CGColor
        layer.borderWidth = 1.0 / UIScreen.mainScreen().scale
        layer.cornerRadius = frame.size.height*0.5
        clipsToBounds = true
        
        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.mainScreen().scale
        layer.shouldRasterize = true
    }
    
    // MARK: - Misc
    
    override public func updateColor() {
        super.updateColor()
        layer.borderColor = enabled ? (selected ? selectedBorderColor.CGColor : normalBorderColor.CGColor) : disabledBorderColor.CGColor
    }
    
}

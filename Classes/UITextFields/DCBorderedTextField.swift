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
    public var normalBorderColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            layer.borderColor = normalBorderColor.CGColor
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
            layer.borderWidth = borderWidth / UIScreen.mainScreen().scale
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
        
        borderStyle = UITextBorderStyle.None
        cornerRadius = 6.0
        borderWidth = 1.0
        
        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.mainScreen().scale
        layer.shouldRasterize = true
    }
    
    override public func textRectForBounds(bounds: CGRect) -> CGRect {
        return textRect(bounds)
    }
    
    override public func editingRectForBounds(bounds: CGRect) -> CGRect {
        return textRect(bounds)
    }
    
    // MARK: - Misc
    
    /// We use this internal func in textRectForBounds, editingRectForBounds etc. to adjust an actual rectangle according to applied corner radius
    private func textRect(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, cornerRadius, 0)
    }
    
}

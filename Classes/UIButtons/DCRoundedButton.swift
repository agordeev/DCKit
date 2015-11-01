//
//  DCRoundedButton.swift
//  DCKitSample
//
//  Created by Andrey Gordeev on 5/10/15.
//  Copyright (c) 2015 Andrey Gordeev. All rights reserved.
//

import UIKit

@IBDesignable
public class DCRoundedButton: DCBorderedButton {
    
    /// cornerRadius doesn't work for this control. It's strictly set to frame.size.height*0.5
    override public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
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
    
    // MARK: - Life cycle
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        setCornerRadius()
    }
    
    // MARK: - Build control
    
    override public func customInit() {
        super.customInit()
        
        addBorder()
    }
    
    override public func addBorder() {
        layer.borderColor = normalBorderColor.CGColor
        layer.borderWidth = 1.0 / UIScreen.mainScreen().scale
        setCornerRadius()
        clipsToBounds = true
        
        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        layer.masksToBounds = true
        layer.rasterizationScale = UIScreen.mainScreen().scale
        layer.shouldRasterize = true
    }
    
    private func setCornerRadius() {
        layer.cornerRadius = frame.size.height*0.5
    }
    
    // MARK: - Misc
    
    override public func updateColor() {
        super.updateColor()
        layer.borderColor = enabled ? (selected ? selectedBorderColor.CGColor : normalBorderColor.CGColor) : disabledBorderColor.CGColor
    }
    
}

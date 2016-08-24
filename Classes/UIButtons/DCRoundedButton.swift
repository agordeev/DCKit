//
//  DCRoundedButton.swift
//  DCKitSample
//
//  Created by Andrey Gordeev on 5/10/15.
//  Copyright (c) 2015 Andrey Gordeev. All rights reserved.
//

import UIKit

@IBDesignable
open class DCRoundedButton: DCBorderedButton {
    
    /// cornerRadius doesn't work for this control. It's strictly set to frame.size.height*0.5
    override open var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
        }
    }
    
    // MARK: - Life cycle
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        setCornerRadius()
    }
    
    // MARK: - Build control
    
    override open func customInit() {
        super.customInit()
        
        addBorder()
    }
    
    override open func addBorder() {
        layer.borderColor = normalBorderColor.cgColor
        layer.borderWidth = 1.0 / UIScreen.main.scale
        setCornerRadius()
        clipsToBounds = true
        
        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        layer.masksToBounds = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }
    
    private func setCornerRadius() {
        layer.cornerRadius = frame.size.height*0.5
    }
    
}

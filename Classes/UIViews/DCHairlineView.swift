//
//  HairlineView.swift
//  DCKit
//
//  Created by Andrey Gordeev on 28/12/14.
//  Copyright (c) 2014 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// This view can be used as a thin/thick separator line between views.
@IBDesignable
public class DCHairlineView: UIView {
    
    @IBInspectable public var borderColor: UIColor = UIColor.blackColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
            backgroundColor = UIColor.clearColor()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = (borderWidth / UIScreen.mainScreen().scale) / 2.0
        }
    }
    
    // MARK: - Life cycle
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.borderWidth = (borderWidth / UIScreen.mainScreen().scale) / 2.0
        layer.borderColor = borderColor.CGColor
    }

}

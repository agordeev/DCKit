//
//  BorderedView.swift
//  DCKit
//
//  Created by Andrey Gordeev on 12/02/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

@IBDesignable
open class DCBorderedView: DCBaseView {
    
    @IBInspectable open var borderColor: UIColor = UIColor.lightGray {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable open var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    open var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth / UIScreen.main.scale
        }
    }
    
    // MARK: - Build control
    
    override open func customInit() {
        super.customInit()
        
        addBorder()
    }
    
    open func addBorder() {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth / UIScreen.main.scale
        
        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        layer.masksToBounds = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }
    

}

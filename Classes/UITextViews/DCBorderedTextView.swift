//
//  DCBorderedTextView.swift
//  DCKitSample
//
//  Created by Andrey Gordeev on 5/8/15.
//  Copyright (c) 2015 Andrey Gordeev. All rights reserved.
//

import UIKit

@IBDesignable
public class DCBorderedTextView: DCBaseTextView {
    
    @IBInspectable public var normalBorderColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            layer.borderColor = normalBorderColor.CGColor
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 6.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth / UIScreen.mainScreen().scale
        }
    }

}

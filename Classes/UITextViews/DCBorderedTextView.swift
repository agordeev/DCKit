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
    
    // MARK: - Initializers
    
    // IBDesignables require both of these inits, otherwise we'll get an error: IBDesignable View Rendering times out.
    // http://stackoverflow.com/questions/26772729/ibdesignable-view-rendering-times-out
    
    override public init(frame: CGRect, textContainer: NSTextContainer!) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

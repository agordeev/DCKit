//
//  DCBorderedTextView.swift
//  DCKitSample
//
//  Created by Andrey Gordeev on 5/8/15.
//  Copyright (c) 2015 Andrey Gordeev. All rights reserved.
//

import UIKit

/// Text view with the ability to set a border with a corner.
@IBDesignable open class DCBorderedTextView: DCBaseTextView {

    /// Border color for Normal state.
    @IBInspectable open var normalBorderColor: UIColor = UIColor.lightGray {
        didSet {
            layer.borderColor = normalBorderColor.cgColor
        }
    }

    /// The control's corner radius.
    @IBInspectable open var cornerRadius: CGFloat = 6.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

    /// The control's border width. Gets automatically scaled with using UIScreen.main.scale.
    @IBInspectable open var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth / UIScreen.main.scale
        }
    }

    // MARK: - Initialization

    // IBDesignables require both of these inits, otherwise we'll get an error: IBDesignable View Rendering times out.
    // http://stackoverflow.com/questions/26772729/ibdesignable-view-rendering-times-out

    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

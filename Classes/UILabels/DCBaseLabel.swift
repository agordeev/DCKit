//
//  BaseLabel.swift
//  DCKit
//
//  Created by Andrey Gordeev on 28/01/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// Base label class.
open class DCBaseLabel: UILabel {

    // MARK: - Initializers

    // IBDesignables require both of these inits, otherwise we'll get an error: IBDesignable View Rendering times out.
    // http://stackoverflow.com/questions/26772729/ibdesignable-view-rendering-times-out

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
    open func customInit() {
        configureFont()
        configureColor()
    }

    /// Configures control's font.
    open func configureFont() {
    }

    /// Configures control's label.
    open func configureColor() {
    }

}

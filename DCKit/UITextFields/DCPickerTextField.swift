//
//  PickerTextField.swift
//  DCKit
//
//  Created by Andrey Gordeev on 29/01/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// This text field can be used for UIDatePicker and UIPickerView.
/// It has Select/Paste menu disabled, as well as zoom functionality and blinking cursor
@IBDesignable open class DCPickerTextField: DCBorderedTextField {

    // MARK: - Initializers

    // IBDesignables require both of these inits, otherwise we'll get an error: IBDesignable View Rendering times out.
    // http://stackoverflow.com/questions/26772729/ibdesignable-view-rendering-times-out

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Building control

    override open func customInit() {
        super.customInit()

        tintColor = UIColor.clear
    }

    /**
     Disables a magnifying glass for the text field.

     - note: http://stackoverflow.com/questions/10640781/disable-magnifying-glass-in-uitextview

     - parameter gestureRecognizer: A gesture recognizer.
     */
    override open func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer is UILongPressGestureRecognizer {
            gestureRecognizer.isEnabled = false
        }
        super.addGestureRecognizer(gestureRecognizer)
    }

    /**
     Disables copy/cut/paste/select all menu.

     - note: http://stackoverflow.com/questions/1426731/how-disable-copy-cut-select-select-all-in-uitextview

     - parameter action: A selector.
     - parameter sender: A sender.

     - returns: canPerformAction.
     */
    override open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }

}

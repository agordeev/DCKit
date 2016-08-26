//
//  BaseTextView.swift
//  DCKit
//
//  Created by Andrey Gordeev on 29/01/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// Base text view class.
@IBDesignable open class DCBaseTextView: UITextView {

    /// For some reasons setting tintColor from IB doesn't work, so we have to add a property for that
    @IBInspectable open var cursorColor: UIColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0) {
        didSet {
            tintColor = cursorColor
        }
    }

    /// Shows whether we should show the toolbar with Done button of not.
    @IBInspectable open var showToolbar: Bool = true {
        didSet {
            inputAccessoryView = showToolbar ? keyboardToolbar : nil
        }
    }

    /// A toolbar with Done button.
    private var keyboardToolbar = UIToolbar()

    // MARK: - Initializers

    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: nil)

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
        addToolbar()
    }

    open func configureFont() {
    }

    open func configureColor() {
    }

    /// Adds toolbar with Done button, which dismisses the keyboard.
    open func addToolbar() {
        keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
            target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done,
            target: self, action: #selector(UIView.endEditing(_:)))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        inputAccessoryView = keyboardToolbar
    }

}

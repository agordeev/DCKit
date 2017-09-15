//
//  BaseTextField.swift
//  DCKit
//
//  Created by Andrey Gordeev on 27/12/14.
//  Copyright (c) 2014 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// Base text field class.
@IBDesignable open class DCBaseTextField: UITextField {

    /// Placeholder text color.
    @IBInspectable open var placeholderColor: UIColor = UIColor(white: 0.7, alpha: 1.0) {
        didSet {
            if let placeholder = placeholder {
                attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedStringKey.foregroundColor: placeholderColor, NSAttributedStringKey.font: font!])
            }
        }
    }

    /// A blinking cursor color.
    /// For some reasons setting tintColor from IB doesn't work, so we have to add a property for that.
    @IBInspectable open var cursorColor: UIColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0) {
        didSet {
            tintColor = cursorColor
        }
    }

    /// Set this property to `true` if you want to show a toolbar with Done button above the keyboard when the text field is in focus.
    /// Default is `true`.
    @IBInspectable open var showDoneButton: Bool = true {
        didSet {
            inputAccessoryView = showDoneButton ? keyboardToolbar : nil
        }
    }

    /// A toolbar with Done button.
    private let keyboardToolbar = UIToolbar()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        customInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        customInit()
    }

    // MARK: - Building TextField

    /// Overriden method must call `super.customInit()`.
    open func customInit() {
        configureFont()
        configureColor()
        configurePlaceholder()
        configureToolbar()
    }

    /// Configures control's font.
    open func configureFont() {
    }

    /// Configures control's color.
    open func configureColor() {
    }

    /// Configures control's placeholder.
    open func configurePlaceholder() {
    }

    /// Adds toolbar with Done button, which dismisses the keyboard.
    open func configureToolbar() {
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
            target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done,
            target: self, action: #selector(UIView.endEditing(_:)))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        inputAccessoryView = keyboardToolbar
    }

}

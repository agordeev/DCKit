//
//  BaseTextField.swift
//  DCKit
//
//  Created by Andrey Gordeev on 27/12/14.
//  Copyright (c) 2014 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

@IBDesignable
public class DCBaseTextField: UITextField {
    
    @IBInspectable
    public var placeholderColor: UIColor = UIColor(white: 0.7, alpha: 1.0) {
        didSet {
            if let placeholder = placeholder {
                attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSForegroundColorAttributeName: placeholderColor, NSFontAttributeName: font!])
            }
        }
    }
    
    /// For some reasons setting tintColor from IB doesn't work, so we have to add a property for that
    @IBInspectable
    public var cursorColor: UIColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0) {
        didSet {
            tintColor = cursorColor
        }
    }
    
    @IBInspectable
    public var showDoneButton: Bool = true {
        didSet {
            inputAccessoryView = showDoneButton ? keyboardToolbar : nil
        }
    }
    
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
    
    /// Overriden method must call super.customInit().
    public func customInit() {
        configureFont()
        configureColor()
        configurePlaceholder()
        configureToolbar()
    }
    
    public func configureFont() {
    }
    
    public func configureColor() {
    }
    
    public func configurePlaceholder() {
    }
    
    /// Adds toolbar with Done button, which dismisses the keyboard.
    public func configureToolbar() {
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace,
            target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .Done,
            target: self, action: #selector(UIView.endEditing(_:)))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        inputAccessoryView = keyboardToolbar
    }
    
}
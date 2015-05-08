//
//  BaseTextField.swift
//  DesignableControlsKit
//
//  Created by Andrey Gordeev on 27/12/14.
//  Copyright (c) 2014 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

@IBDesignable
public class DCKBaseTextField: UITextField {
    
    @IBInspectable
    public var placeholderColor: UIColor = UIColor(white: 0.7, alpha: 1.0) {
        didSet {
            if let placeholder = placeholder {
                attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSForegroundColorAttributeName: placeholderColor, NSFontAttributeName: font])
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customInit()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        customInit()
    }
    
    // MARK: - Building TextField
    
    public func customInit() {
        configureFont()
        configureColor()
        configurePlaceholder()
    }
    
    public func configureFont() {
        // Put the code here if you want to customize all text fields in the app
    }
    
    public func configureColor() {
        // Put the code here if you want to customize all text fields in the app
    }
    
    public func configurePlaceholder() {
        // Put the code here if you want to customize all text fields in the app
    }
}
//
//  BorderedTextField.swift
//  DCKit
//
//  Created by Andrey Gordeev on 16/02/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// Border is red if selected
@IBDesignable
public class DCMandatoryTextField: DCBorderedTextField {
    
    override public var selected: Bool {
        didSet {
            updateColor()
        }
    }
   
    @IBInspectable
    public var highlightedBorderColor: UIColor = UIColor.redColor() {
        didSet {
            updateColor()
        }
    }
    
    @IBInspectable
    public var isMandatory: Bool = true
    
    // MARK: - Build control
    
    override public func customInit() {
        super.customInit()
        
        updateColor()
        isValid()
    }
    
    override public func configurePlaceholder() {
        
    }
    
    // MARK: - Validation
    
    /// Checks if the field's value is valid. Can be overriden by subclasses.
    /// :return: True, if the field is mandatory and value is not empty.
    public func isValid() -> Bool {
        if isMandatory {
            var valid = !(text ?? "").isEmpty
            selected = !valid
            return valid
        }
        else {
            return true
        }
    }
    
    // MARK: - Misc
    
    func updateColor() {
        layer.borderColor = selected ? highlightedBorderColor.CGColor : defaultBorderColor.CGColor
    }
    
}

//
//  BorderedTextField.swift
//  DesignableControlsKit
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
    
    // IBDesignables require both of these inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Build text field
    
    override public func customInit() {
        super.customInit()
        
        updateColor()
        isValid()
    }
    
    override public func configurePlaceholder() {
        
    }
    
    // MARK: - Misc
    
    public func isValid() -> Bool {
        if isMandatory {
            var valid = (text ?? "") != ""
            selected = !valid
            return valid
        }
        else {
            return true
        }
    }
    
    func updateColor() {
        layer.borderColor = selected ? highlightedBorderColor.CGColor : defaultBorderColor.CGColor
    }
    
}

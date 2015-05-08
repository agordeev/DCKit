//
//  MandatoryNumberTextField.swift
//  DCKit
//
//  Created by Andrey Gordeev on 11/03/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

public class DCMandatoryNumberTextField: DCMandatoryTextField {
    
    @IBInspectable public var maxValue: Float = 999
    
    // MARK: - Build control
    
    override public func customInit() {
        super.customInit()
        keyboardType = UIKeyboardType.DecimalPad
    }
    
    // MARK: - Validation
    
    override public func isValid() -> Bool {
        let value = (text as NSString).floatValue
        
        var valid = value < maxValue
        
        // If the field is Mandatory and empty - it's invalid
        if text == "" {
            valid = !isMandatory
        }
        
        selected = !valid
        return valid
    }
    
}

//
//  MandatoryNumberTextField.swift
//  DesignableControlsKit
//
//  Created by Andrey Gordeev on 11/03/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

public class DCKMandatoryNumberTextField: DCKMandatoryTextField {
    
    @IBInspectable public var maxValue: Float = 999
    
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

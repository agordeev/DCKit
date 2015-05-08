//
//  MandatoryEmailTextField.swift
//  DesignableControlsKit
//
//  Created by Andrey Gordeev on 02/03/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

@IBDesignable
public class DCKMandatoryEmailTextField: DCKMandatoryTextField {
    
    // IBDesignables require both of these inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func isValid() -> Bool {
        var valid = isValidEmail(text)
        
        // If the field is Mandatory and empty - it's invalid
        if text == "" {
            valid = !isMandatory
        }
        
        selected = !valid
        return valid
    }
    
    // MARK: - Validation
    
    /// Validates email
    public func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
    }
    
}

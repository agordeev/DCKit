//
//  MandatoryEmailTextField.swift
//  DCKit
//
//  Created by Andrey Gordeev on 02/03/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

@IBDesignable
public class DCMandatoryEmailTextField: DCMandatoryTextField {
    
    // MARK: - Validation
    
    override public func isValid() -> Bool {
        var valid = isValidEmail(text)
        
        // If the field is Mandatory and empty - it's invalid
        if text == "" {
            valid = !isMandatory
        }
        
        selected = !valid
        return valid
    }
    
    /// Validates given email address. The exression was taken from here: http://stackoverflow.com/questions/5428304/email-validation-on-textfield-in-iphone-sdk
    public func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
    }
    
}

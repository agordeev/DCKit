//
//  MandatoryNumberTextField.swift
//  DCKit
//
//  Created by Andrey Gordeev on 11/03/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// Allows to set a max possible value.
open class DCMandatoryNumberTextField: DCMandatoryTextField {

    /// The field's value will be compared against this property.
    /// - seealso: `isValid()`
    @IBInspectable open var maxValue: Float = 999

    // MARK: - Build control

    override open func customInit() {
        super.customInit()
        keyboardType = UIKeyboardType.decimalPad
    }

    // MARK: - Validation

    override open func isValid() -> Bool {
        var valid = true

        if let value = Float(text ?? "") {
            valid = value < maxValue
        } else {
            // If the field is Mandatory and empty - it's invalid
            valid = !isMandatory
        }

        isSelected = !valid
        return valid
    }

}

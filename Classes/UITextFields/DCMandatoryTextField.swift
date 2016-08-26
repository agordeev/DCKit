//
//  BorderedTextField.swift
//  DCKit
//
//  Created by Andrey Gordeev on 16/02/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

/// Highlights the text field if the entered value is false.
@IBDesignable open class DCMandatoryTextField: DCBorderedTextField {

    override open var isSelected: Bool {
        didSet {
            updateColor()
        }
    }

    /// Border color for Highlighted state.
    @IBInspectable open var highlightedBorderColor: UIColor = UIColor.red {
        didSet {
            updateColor()
        }
    }

    /// If `true`, `isValid()` will return `false` for the empty control.
    @IBInspectable open var isMandatory: Bool = true

    // MARK: - Build control

    override open func customInit() {
        super.customInit()

        updateColor()
        let _ = isValid()
        self.addTarget(self, action: #selector(DCMandatoryTextField.isValid), for: UIControlEvents.editingChanged)
    }

    // MARK: - Validation

    /**
     Checks if the field's value is valid. Can be overriden by subclasses.

     - returns: True, if the field is mandatory and value is not empty.
     */
    open func isValid() -> Bool {
        if isMandatory {
            let valid = !(text ?? "").isEmpty
            isSelected = !valid
            return valid
        } else {
            return true
        }
    }

    // MARK: - Misc

    func updateColor() {
        layer.borderColor = isSelected ? highlightedBorderColor.cgColor : normalBorderColor.cgColor
    }

}

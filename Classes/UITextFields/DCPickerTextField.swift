//
//  PickerTextField.swift
//  DesignableControlsKit
//
//  Created by Andrey Gordeev on 29/01/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

// This text field can be user for UIDatePicker and UIPickerView
// It has Select/Paste menu disabled, as well as zoom functionality and blinking cursor
@IBDesignable
public class DCPickerTextField: DCBorderedTextField {
    
    // IBDesignables require both of these inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Building TextField
    
    override public func customInit() {
        super.customInit()
        
        tintColor = UIColor.clearColor()
    }
    
    // http://stackoverflow.com/questions/10640781/disable-magnifying-glass-in-uitextview
    override public func addGestureRecognizer(gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer is UILongPressGestureRecognizer {
            gestureRecognizer.enabled = false
        }
        super.addGestureRecognizer(gestureRecognizer)
    }
    
    // http://stackoverflow.com/questions/1426731/how-disable-copy-cut-select-select-all-in-uitextview
    override public func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        return false
    }

}

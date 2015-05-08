//
//  BaseTextView.swift
//  DesignableControlsKit
//
//  Created by Andrey Gordeev on 29/01/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

public class DCBaseTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: nil)
        
        customInit()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        customInit()
    }
    
    // MARK: - Build Text View
    
    public func customInit() {
        configureFont()
        configureColor()
    }
    
    func configureFont() {
    }
    
    func configureColor() {
    }

}

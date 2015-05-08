//
//  BaseLabel.swift
//  DesignableControlsKit
//
//  Created by Andrey Gordeev on 28/01/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

public class DCKBaseLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customInit()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        customInit()
    }
    
    // MARK: - Build Label
    
    public func customInit() {
        configureFont()
        configureColor()
    }
    
    public func configureFont() {
    }
    
    public func configureColor() {
    }

}

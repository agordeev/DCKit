//
//  CircleView.swift
//  DesignableControlsKit
//
//  Created by Andrey Gordeev on 13/02/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

@IBDesignable
public class DCCircleView: UIView {
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        customInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customInit()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        customInit()
    }
    
    // MARK: - Build View
    
    public func customInit() {
        layer.cornerRadius = frame.size.height*0.5
        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        layer.masksToBounds = true
        layer.rasterizationScale = UIScreen.mainScreen().scale
        layer.shouldRasterize = true
    }


}

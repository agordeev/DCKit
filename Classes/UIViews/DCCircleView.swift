//
//  CircleView.swift
//  DCKit
//
//  Created by Andrey Gordeev on 13/02/15.
//  Copyright (c) 2015 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

@IBDesignable
public class DCCircleView: DCBorderedView {
    
    // MARK: - Life cycle
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        updateLayerSettings()
    }
    
    // MARK: - Build control
    
    override public func customInit() {
        super.customInit()
        
        updateLayerSettings()
    }

    private func updateLayerSettings() {
        layer.cornerRadius = frame.size.height*0.5
        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        layer.masksToBounds = true
        layer.rasterizationScale = UIScreen.mainScreen().scale
        layer.shouldRasterize = true
    }

}

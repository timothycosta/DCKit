//
//  BorderedButton.swift
//  Socium
//
//  Created by Andrey Gordeev on 27/12/14.
//  Copyright (c) 2014 Andrey Gordeev (andrew8712@gmail.com). All rights reserved.
//

import UIKit

@IBDesignable
public class DCBorderedButton: DCBaseButton {
    
    override public var enabled: Bool {
        didSet {
            updateColor()
        }
    }
    
    @IBInspectable var normalBorderColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            updateColor()
        }
    }
    
    @IBInspectable var disabledBorderColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            updateColor()
        }
    }
    
    @IBInspectable var selectedBorderColor: UIColor = UIColor(red: 37.0/255.0, green: 147.0/255.0, blue: 1.0/255.0, alpha: 1.0) {
        didSet {
            updateColor()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    // MARK: - Build control
    
    override public func customInit() {
        super.customInit()
        
        addBorder()
    }
    
    public func addBorder() {
        layer.borderColor = normalBorderColor.CGColor
        layer.borderWidth = 1.0 / UIScreen.mainScreen().scale
        
        // http://stackoverflow.com/questions/4735623/uilabel-layer-cornerradius-negatively-impacting-performance
        layer.masksToBounds = false
        layer.rasterizationScale = UIScreen.mainScreen().scale
        layer.shouldRasterize = true
    }
    
    // MARK: - Misc
    
    override public func updateColor() {
        super.updateColor()
        layer.borderColor = enabled ? (selected ? selectedBorderColor.CGColor : normalBorderColor.CGColor) : disabledBorderColor.CGColor
    }
    
}
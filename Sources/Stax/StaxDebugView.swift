//
//  StaxDebugView.swift
//  
//
//  Created by Alex Nagy on 04.12.2020.
//

import UIKit

/// Stax Debug View
@available(iOS 13.0, *)
public class StaxDebugView: UIView {
    
    private let horizontalLine = UIView()
    private let verticalLine = UIView()
    
    private let label = UILabel()
    private var lineWidth: CGFloat!
    
    /// Initializes a Stax debug view
    /// - Parameters:
    ///   - backgroundColor: backgroundColor
    ///   - options: options
    public init(backgroundColor: UIColor = .clear, options: StaxDebugOptions = StaxDebugOptionsType.adaptive) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.lineWidth = options.lineWidth
        
        self.layer.cornerRadius = options.cornerRadius
        self.layer.borderWidth = options.borderWidth
        self.layer.borderColor = options.color.cgColor
        self.layer.masksToBounds = true
        
        horizontalLine.background(color: options.color)
        horizontalLine.center(in: self)
        
        verticalLine.background(color: options.color)
        verticalLine.center(in: self)
        
        label.layer.cornerRadius = options.textCornerRadius
        label.layer.masksToBounds = true
        label.font = options.font
        label.textColor = options.textColor
        label.background(color: options.color)
        label.center(in: self)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        label.text = " \(Int(self.frame.width)) x \(Int(self.frame.height)) "
        horizontalLine.size(width: self.frame.width, height: lineWidth)
        verticalLine.size(width: lineWidth, height: self.frame.height)
    }
}



//
//  StaxDebugOptions.swift
//  
//
//  Created by Alex Nagy on 04.12.2020.
//

import UIKit

@available(iOS 13.0, *)
public struct StaxDebugOptions {
    let borderWidth: CGFloat
    let cornerRadius: CGFloat
    let color: UIColor
    let lineWidth: CGFloat
    let font: UIFont
    let textColor: UIColor
    let textCornerRadius: CGFloat
    
    public init(borderWidth: CGFloat = 2, cornerRadius: CGFloat = 10, color: UIColor = .label, lineWidth: CGFloat = 2, font: UIFont = .monospacedSystemFont(ofSize: 12.5, weight: .medium), textColor: UIColor = .systemGroupedBackground, textCornerRadius: CGFloat = 5) {
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.color = color
        self.lineWidth = lineWidth
        self.font = font
        self.textColor = textColor
        self.textCornerRadius = textCornerRadius
    }
    
}

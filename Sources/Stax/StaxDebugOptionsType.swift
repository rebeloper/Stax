//
//  StaxDebugOptionsType .swift
//  
//
//  Created by Alex Nagy on 04.12.2020.
//

import Foundation

@available(iOS 13.0, *)
public struct StaxDebugOptionsType {
    public static let dark = StaxDebugOptions(borderWidth: 2, cornerRadius: 10, color: .darkGray, lineWidth: 2, font: .monospacedSystemFont(ofSize: 12.5, weight: .medium), textColor: .white, textCornerRadius: 5)
    public static let light = StaxDebugOptions(borderWidth: 2, cornerRadius: 10, color: .white, lineWidth: 2, font: .monospacedSystemFont(ofSize: 12.5, weight: .medium), textColor: .darkGray, textCornerRadius: 5)
    public static let adaptive = StaxDebugOptions(borderWidth: 2, cornerRadius: 10, color: .label, lineWidth: 2, font: .monospacedSystemFont(ofSize: 12.5, weight: .medium), textColor: .systemGroupedBackground, textCornerRadius: 5)
}

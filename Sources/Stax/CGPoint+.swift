//
//  CGPoint+.swift
//  
//
//  Created by Alex Nagy on 29.11.2020.
//

import UIKit

public extension CGPoint {
    
    /// Convinience method to get a CGPoint with y = 0 and x = constant
    /// - Parameter constant: x
    /// - Returns: CGPoint with set constant
    static func right(_ constant: CGFloat) -> CGPoint {
        CGPoint(x: constant, y: 0)
    }
    
    /// Convinience method to get a CGPoint with y = 0 and x = constant
    /// - Parameter constant: x
    /// - Returns: CGPoint with set constant
    static func left(_ constant: CGFloat) -> CGPoint {
        CGPoint(x: -constant, y: 0)
    }
    
    /// Convinience method to get a CGPoint with x = 0 and y = constant
    /// - Parameter constant: y
    /// - Returns: CGPoint with set constant
    static func top(_ constant: CGFloat) -> CGPoint {
        CGPoint(x: 0, y: -constant)
    }
    
    /// Convinience method to get a CGPoint with x = 0 and y = constant
    /// - Parameter constant: y
    /// - Returns: CGPoint with set constant
    static func bottom(_ constant: CGFloat) -> CGPoint {
        CGPoint(x: 0, y: constant)
    }
}


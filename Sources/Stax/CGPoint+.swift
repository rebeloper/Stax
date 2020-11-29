//
//  CGPoint+.swift
//  
//
//  Created by Alex Nagy on 29.11.2020.
//

import UIKit

public extension CGPoint {
    public static func right(_ constant: CGFloat) -> CGPoint {
        CGPoint(x: constant, y: 0)
    }
    
    public static func left(_ constant: CGFloat) -> CGPoint {
        CGPoint(x: -constant, y: 0)
    }
    
    public static func top(_ constant: CGFloat) -> CGPoint {
        CGPoint(x: 0, y: -constant)
    }
    
    public static func bottom(_ constant: CGFloat) -> CGPoint {
        CGPoint(x: 0, y: constant)
    }
}


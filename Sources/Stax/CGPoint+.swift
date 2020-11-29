//
//  CGPoint+.swift
//  
//
//  Created by Alex Nagy on 29.11.2020.
//

import UIKit

public extension CGPoint {
    static func right(_ constant: CGFloat) -> CGPoint {
        CGPoint(x: constant, y: 0)
    }
    
    static func left(_ constant: CGFloat) -> CGPoint {
        CGPoint(x: -constant, y: 0)
    }
    
    static func top(_ constant: CGFloat) -> CGPoint {
        CGPoint(x: 0, y: -constant)
    }
    
    static func bottom(_ constant: CGFloat) -> CGPoint {
        CGPoint(x: 0, y: constant)
    }
}


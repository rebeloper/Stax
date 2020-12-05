//
//  CGSize+.swift
//  
//
//  Created by Alex Nagy on 05.12.2020.
//

import UIKit

public extension CGSize {
    static func square(_ length: CGFloat) -> CGSize {
        CGSize(width: length, height: length)
    }
}

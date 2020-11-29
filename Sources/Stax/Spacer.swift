//
//  Spacer.swift
//  
//
//  Created by Alex Nagy on 29.11.2020.
//

import UIKit

@available(iOS 11.0, *)
public class Spacer: UIView {
    public init(width: CGFloat? = nil, height: CGFloat? = nil) {
        super.init(frame: .zero)
        if let width = width, let height = height {
            self.size(width: width, height: height)
        } else if let width = width, height == nil {
            self.width(width)
        } else if let height = height, width == nil {
            self.height(height)
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

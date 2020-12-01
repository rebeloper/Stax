//
//  Line.swift
//  
//
//  Created by Alex Nagy on 01.12.2020.
//

import UIKit

/// Divider view
@available(iOS 11.0, *)
public class Line: UIView {
    
    /// Creates a divider view with an optional length. Default `axis` is `.vertical`
    /// - Parameters:
    ///   - axis: axis
    ///   - lenght: length
    public init(_ axis: NSLayoutConstraint.Axis = .vertical, _ length: CGFloat = 1, _ backgroundColor: UIColor = .systemGray) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        switch axis {
        case .horizontal:
            self.height(length)
        case .vertical:
            self.width(length)
        @unknown default:
            print("@unknown default")
        }
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/// Vertical Divider view
@available(iOS 11.0, *)
public class VLine: UIView {
    
    /// Creates a vertical divider view with an optional length.
    /// - Parameters:
    ///   - axis: axis
    ///   - lenght: length
    public init(_ length: CGFloat = 16, _ backgroundColor: UIColor = .systemGray) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.height(length)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/// Horizontal Divider view
@available(iOS 11.0, *)
public class HLine: UIView {
    
    /// Creates a horizontal divider view with an optional length.
    /// - Parameters:
    ///   - axis: axis
    ///   - lenght: length
    public init(_ length: CGFloat = 16, _ backgroundColor: UIColor = .systemGray) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.width(length)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


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
    public init(_ axis: NSLayoutConstraint.Axis = .vertical, _ length: CGFloat = 1, _ backgroundColor: UIColor = .systemGray, insets: UIEdgeInsets = .zero, withRoundedCorners: Bool = true) {
        super.init(frame: .zero)
        let view = UIView(backgroundColor: backgroundColor)
        if withRoundedCorners {
            view.layer.cornerRadius = length / 2
//            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            view.layer.masksToBounds = true
        }
        switch axis {
        case .horizontal:
            HStack(HDivider(insets.left),
                   UIView(backgroundColor: backgroundColor),
                   HDivider(insets.right)).layout(in: self)
            self.height(length)
        case .vertical:
            VStack(VDivider(insets.top),
                   UIView(backgroundColor: backgroundColor),
                   VDivider(insets.bottom)).layout(in: self)
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
    public init(_ length: CGFloat = 1, _ backgroundColor: UIColor = .systemGray, insets: UIEdgeInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0), withRoundedCorners: Bool = true) {
        super.init(frame: .zero)
        let view = UIView(backgroundColor: backgroundColor)
        if withRoundedCorners {
            view.layer.cornerRadius = length / 2
//            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            view.layer.masksToBounds = true
        }
        VStack(VDivider(insets.top),
               view,
               VDivider(insets.bottom)).layout(in: self)
        self.width(length)
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
    public init(_ length: CGFloat = 1, _ backgroundColor: UIColor = .systemGray, insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12), withRoundedCorners: Bool = true) {
        super.init(frame: .zero)
        let view = UIView(backgroundColor: backgroundColor)
        if withRoundedCorners {
            view.layer.cornerRadius = length / 2
//            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            view.layer.masksToBounds = true
        }
        HStack(HDivider(insets.left),
               view,
               HDivider(insets.right)).layout(in: self)
        self.height(length)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


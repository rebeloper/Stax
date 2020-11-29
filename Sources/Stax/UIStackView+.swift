//
//  UIStackView+.swift
//  
//
//  Created by Alex Nagy on 29.11.2020.
//

import UIKit

@available(iOS 11.0, *)
extension UIStackView {
    
    /// Set the spacing between the stack view's arranged subviews
    /// - Parameter constant: constant
    /// - Returns: stack view
    @discardableResult
    public func spacing(_ constant: CGFloat = 8) -> UIStackView {
        spacing = constant
        return self
    }
    
    /// Set the stack view axis
    /// - Parameter axis: axis
    /// - Returns: stack view
    @discardableResult
    public func axis(_ axis: NSLayoutConstraint.Axis) -> UIStackView {
        self.axis = axis
        return self
    }
    
    /// Set the stack view alignment
    /// - Parameter alignment: alignment
    /// - Returns: stack view
    @discardableResult
    public func alignment(_ alignment: UIStackView.Alignment) -> UIStackView {
        self.alignment = alignment
        return self
    }
    
    /// Set the stack view distribution
    /// - Parameter distribution: distribution
    /// - Returns: stack view
    @discardableResult
    public func distribution(_ distribution: UIStackView.Distribution) -> UIStackView {
        self.distribution = distribution
        return self
    }
    
    /// Set the padding of the stack view with an `UIEdgeInsets`
    /// - Parameter insets: insets
    /// - Returns: stack view
    @discardableResult
    public func padding(_ insets: UIEdgeInsets) -> UIStackView {
        layoutMargins = insets
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    /// Set the padding of the stack view with a constant
    /// - Parameter constant: constant
    /// - Returns: stack view
    @discardableResult
    public func padding(by constant: CGFloat = 8) -> UIStackView {
        padding(UIEdgeInsets(top: constant, left: constant, bottom: constant, right: constant))
    }
    
    /// Sets the padding of the stack view padding type with a constant
    /// - Parameters:
    ///   - type: padding type
    ///   - constant: stack view padding constant
    /// - Returns: stack view
    @discardableResult
    public func padding(_ type: PaddingType, _ constant: CGFloat = 8) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        switch type {
        case .leading:
            layoutMargins.left = constant
        case .trailing:
            layoutMargins.right = constant
        case .top:
            layoutMargins.top = constant
        case .bottom:
            layoutMargins.bottom = constant
        case .horizontal:
            layoutMargins.left = constant
            layoutMargins.right = constant
        case .vertical:
            layoutMargins.top = constant
            layoutMargins.bottom = constant
        }
        return self
    }
    
    /// Centers a view inside a parent view with a size and offset
    /// - Parameters:
    ///   - view: parent view
    ///   - size: size of the view
    ///   - offset: offset of the view
    /// - Returns: stack view
    @discardableResult
    public func center(inside view: UIView, size: CGSize = .zero, offset: CGPoint = .zero) -> UIStackView {
        view.addSubview(self)
        centerInSuperview(size: size, offset: offset)
        return self
    }
    
    /// Lays out the view in a parent view woth safe area and padding
    /// - Parameters:
    ///   - view: the parent view
    ///   - withSafeArea: safe area
    ///   - padding: padding
    /// - Returns: stack view
    @discardableResult
    public func layout(in view: UIView, withSafeArea: Bool = false, padding: UIEdgeInsets = .zero) -> UIStackView {
        view.addSubview(self)
        if withSafeArea {
            self.fillSuperviewSafeAreaLayoutGuide(padding: padding)
        } else {
            self.fillSuperview(padding: padding)
        }
        return self
    }
    
    /// Sets the background color of the stack view
    /// - Parameter color: color
    /// - Returns: stack view
    @discardableResult
    public func background(color: UIColor) -> UIStackView {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
        return self
    }
    
    /// Embeds the stack view into a scroll view with a default axis of `.vertical`
    /// - Parameter axis: axis of the scroll view
    /// - Returns: scroll view
    @discardableResult
    public func scrolls(_ axis: NSLayoutConstraint.Axis = .vertical) -> ScrollView {
        let scrollView = ScrollView(self)
        scrollView.axis(axis)
        return scrollView
    }
}

//
//  UIView+.swift
//  
//
//  Created by Alex Nagy on 29.11.2020.
//

import UIKit

@available(iOS 11.0, *)
extension UIView {
    
    /// Creates a Stack with an axis
    /// - Parameters:
    ///   - axis: axis
    ///   - views: arranged subviews
    /// - Returns: stack view
    fileprivate func _stack(_ axis: NSLayoutConstraint.Axis, views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fill
        addSubview(stackView)
        stackView.fillSuperview()
        return stackView
    }
    
    /// Creates a vertical stack view
    /// - Parameter views: arranged subviews
    /// - Returns: stack view
    @discardableResult
    public func vstack(_ views: [UIView]) -> UIStackView {
        return _stack(.vertical, views: views)
    }
    
    /// Creates a horizontal stack view
    /// - Parameter views: arranged subviews
    /// - Returns: stack view
    @discardableResult
    public func hstack(_ views: [UIView]) -> UIStackView {
        return _stack(.horizontal, views: views)
    }
    
    /// Sets the size of the view with a `CGSize`
    /// - Parameter size: size
    /// - Returns: view
    @discardableResult
    public func size<T: UIView>(_ size: CGSize) -> T {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self as! T
    }
    
    /// Sets the size of the view with a width and height
    /// - Parameters:
    ///   - width: width
    ///   - height: height
    /// - Returns: view
    @discardableResult
    public func size<T: UIView>(width: CGFloat, height: CGFloat) -> T {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self as! T
    }
    
    /// Set the height of a view
    /// - Parameter height: height
    /// - Returns: view
    @discardableResult
    public func height(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    /// Set the width of a view
    /// - Parameter width: width
    /// - Returns: view
    @discardableResult
    public func width(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    /// Sets the size of the view to be a square
    /// - Parameter length: length
    /// - Returns: view
    @discardableResult
    public func square<T: UIView>(_ length: CGFloat) -> T {
        size(width: length, height: length)
    }
    
    /// Sets the background color of the view
    /// - Parameter color: color
    /// - Returns: stack view
    @discardableResult
    public func backgroundColor(_ color: UIColor) -> UIView {
        self.backgroundColor = color
        return self
    }
    
    /// Anchors a view with an array of anchors
    /// - Parameter anchors: anchors
    /// - Returns: constraints
    @discardableResult
    public func anchor(_ anchors: Anchor...) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        anchors.forEach { anchor in
            switch anchor {
            case .top(let anchor, let constant):
                anchoredConstraints.top = topAnchor.constraint(equalTo: anchor, constant: constant)
            case .leading(let anchor, let constant):
                anchoredConstraints.leading = leadingAnchor.constraint(equalTo: anchor, constant: constant)
            case .bottom(let anchor, let constant):
                anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: anchor, constant: -constant)
            case .trailing(let anchor, let constant):
                anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: anchor, constant: -constant)
            case .height(let constant):
                if constant > 0 {
                    anchoredConstraints.height = heightAnchor.constraint(equalToConstant: constant)
                }
            case .width(let constant):
                if constant > 0 {
                    anchoredConstraints.width = widthAnchor.constraint(equalToConstant: constant)
                }
            }
        }
        [anchoredConstraints.top,
         anchoredConstraints.leading,
         anchoredConstraints.bottom,
         anchoredConstraints.trailing,
         anchoredConstraints.width,
         anchoredConstraints.height].forEach {
            $0?.isActive = true
        }
        return anchoredConstraints
    }
    
    /// Anchors a view with specific / optional anchors, padding and size
    /// - Parameters:
    ///   - top: top anchor
    ///   - leading: leading anchor
    ///   - bottom: bottom anchor
    ///   - trailing: trailing abchor
    ///   - padding: padding
    ///   - size: size
    /// - Returns: constraints
    @discardableResult
    public func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    /// Fills the view to the constraints of its superview with padding
    /// - Parameter padding: padding
    /// - Returns: constraints
    @discardableResult
    public func fillSuperview(padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        let anchoredConstraints = AnchoredConstraints()
        guard let superviewTopAnchor = superview?.topAnchor,
            let superviewBottomAnchor = superview?.bottomAnchor,
            let superviewLeadingAnchor = superview?.leadingAnchor,
            let superviewTrailingAnchor = superview?.trailingAnchor else {
                return anchoredConstraints
        }
        
        return anchor(top: superviewTopAnchor, leading: superviewLeadingAnchor, bottom: superviewBottomAnchor, trailing: superviewTrailingAnchor, padding: padding)
    }
    
    /// Fills the view to the constraints of its superviews safe area layout guide with padding
    /// - Parameter padding: padding
    /// - Returns: constraints
    @discardableResult
    public func fillSuperviewSafeAreaLayoutGuide(padding: UIEdgeInsets = .zero) -> AnchoredConstraints {
        let anchoredConstraints = AnchoredConstraints()
        guard let superviewTopAnchor = superview?.safeAreaLayoutGuide.topAnchor,
            let superviewBottomAnchor = superview?.safeAreaLayoutGuide.bottomAnchor,
            let superviewLeadingAnchor = superview?.safeAreaLayoutGuide.leadingAnchor,
            let superviewTrailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor else {
                return anchoredConstraints
        }
        return anchor(top: superviewTopAnchor, leading: superviewLeadingAnchor, bottom: superviewBottomAnchor, trailing: superviewTrailingAnchor, padding: padding)
    }
    
    /// Centers the view in its super view with size and offset
    /// - Parameters:
    ///   - size: size of view
    ///   - offset: offset of view
    /// - Returns: super view
    @discardableResult
    public func centerInSuperview(size: CGSize = .zero, offset: CGPoint = .zero) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor, constant: offset.x).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor, constant: offset.y).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        return superview!
    }
    
    /// Adds to super view and centers the view in its super view with size and offset
    /// - Parameters:
    ///   - view: view
    ///   - size: size of the view
    ///   - offset: offset of the view
    /// - Returns: super view
    @discardableResult
    public func center(in view: UIView, size: CGSize = .zero, offset: CGPoint = .zero) -> UIView {
        view.addSubview(self)
        return centerInSuperview(size: size, offset: offset)
    }
    
    /// Convenience init with background color
    /// - Parameter backgroundColor: color
    convenience public init(backgroundColor: UIColor = .clear) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
}


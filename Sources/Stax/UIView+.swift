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
    
    /// Set the width and height of a view with optinal delay and animation (set by providing the superview)
    /// - Parameter width: width
    /// - Parameter height: height
    /// - Parameter animatedInView: animatedInView
    /// - Returns: view
    @discardableResult
    public func size<T: UIView>(width: CGFloat, height: CGFloat, animatedInRootView: UIView? = nil) -> T {
        self.set(width: width, height: height)
        if animatedInRootView != nil {
            UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
                animatedInRootView!.layoutIfNeeded()
            }).startAnimation()
        }
        return self as! T
    }
    
    /// Set the width and height of a view with optinal delay and animation (set by providing the superview)
    /// - Parameter width: width
    /// - Parameter height: height
    /// - Parameter animatedInView: animatedInView
    /// - Returns: view
    @discardableResult
    public func size<T: UIView>(_ size: CGSize, animatedInRootView: UIView? = nil) -> T {
        self.set(width: size.width, height: size.height)
        if animatedInRootView != nil {
            UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
                animatedInRootView!.layoutIfNeeded()
            }).startAnimation()
        }
        return self as! T
    }
    
    /// Set the width and height of a view
    /// - Parameter width: width
    /// - Parameter height: height
    /// - Returns: view
    @discardableResult
    public func set<T: UIView>(width: CGFloat, height: CGFloat) -> T {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self as! T
    }
    
    /// Set the height of a view with optinal delay and animation (set by providing the superview)
    /// - Parameter height: height
    /// - Parameter animatedInView: animatedInView
    /// - Returns: view
    @discardableResult
    public func height<T: UIView>(_ height: CGFloat, animatedInRootView: UIView? = nil) -> T {
        self.set(height: height)
        if animatedInRootView != nil {
            UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
                animatedInRootView!.layoutIfNeeded()
            }).startAnimation()
        }
        return self as! T
    }
    
    /// Set the height of a view
    /// - Parameter height: height
    /// - Returns: view
    @discardableResult
    public func set<T: UIView>(height: CGFloat) -> T {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self as! T
    }
    
    /// Set the width of a view with optinal delay and animation (set by providing the superview)
    /// - Parameter width: width
    /// - Parameter delay: delay
    /// - Parameter animatedInView: animatedInView
    /// - Returns: view
    @discardableResult
    public func width<T: UIView>(_ width: CGFloat, animatedInRootView: UIView? = nil) -> T {
        self.set(width: width)
        if animatedInRootView != nil {
            UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
                animatedInRootView!.layoutIfNeeded()
            }).startAnimation()
        }
        return self as! T
    }
    
    /// Set the width of a view
    /// - Parameter width: width
    /// - Returns: view
    @discardableResult
    public func set<T: UIView>(width: CGFloat) -> T {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        return self as! T
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
    public func background<T: UIView>(color: UIColor) -> T {
        self.backgroundColor = color
        return self as! T
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
    public func centerInSuperview<T: UIView>(size: CGSize = .zero, offset: CGPoint = .zero) -> T {
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
        return superview! as! T
    }
    
    /// Adds to super view and centers the view in its super view with size and offset
    /// - Parameters:
    ///   - view: view
    ///   - size: size of the view
    ///   - offset: offset of the view
    /// - Returns: super view
    @discardableResult
    public func center<T: UIView>(in view: UIView, size: CGSize = .zero, offset: CGPoint = .zero) -> T {
        view.addSubview(self)
        return centerInSuperview(size: size, offset: offset)
    }
    
    /// Hides the view with an optional delay and animation
    /// - Parameters:
    ///   - delay: delay
    ///   - animated: animation
    /// - Returns: view
    @discardableResult
    public func hide<T: UIView>(after delay: Double = 0, animated: Bool = true) -> T {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            UIView.animate(withDuration: animated ? 0.3 : 0.0) {
                self.isHidden = true
            }
        }
        return self as! T
    }
    
    /// Shows the view with an optional delay and animation
    /// - Parameters:
    ///   - delay: delay
    ///   - animated: animation
    /// - Returns: view
    @discardableResult
    public func show<T: UIView>(after delay: Double = 0, animated: Bool = true) -> T {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            UIView.animate(withDuration: animated ? 0.3 : 0.0) {
                self.isHidden = false
            }
        }
        return self as! T
    }
}

@available(iOS 13.0, *)
extension UIView {
    
    /// Convenience init with optional background color and staxDebugOptions
    /// - Parameter backgroundColor: color
    convenience public init(backgroundColor: UIColor = .clear, staxDebugOptions: StaxDebugOptions? = nil) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        if staxDebugOptions != nil {
            self.debug(staxDebugOptions!)
        }
    }
    
    /// Convenience init with optional width, height, backgroundColor and staxDebugOptions
    /// - Parameters:
    ///   - width: width
    ///   - height: height height
    ///   - backgroundColor: backgroundColor
    ///   - staxDebugOptions: staxDebugOptions
    convenience public init(width: CGFloat? = nil, height: CGFloat? = nil, backgroundColor: UIColor = .clear, staxDebugOptions: StaxDebugOptions? = nil) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        if let width = width, height == nil {
            self.width(width)
        } else if let height = height, width == nil {
            self.height(height)
        } else if let width = width, let height = height {
            self.size(width: width, height: height)
        }
        if staxDebugOptions != nil {
            self.debug(staxDebugOptions!)
        }
    }
    
    /// Convenience init with width, optional backgroundColor and staxDebugOptions
    /// - Parameters:
    ///   - width: width
    ///   - backgroundColor: backgroundColor
    ///   - staxDebugOptions: staxDebugOptions
    convenience public init(width: CGFloat, backgroundColor: UIColor = .clear, staxDebugOptions: StaxDebugOptions? = nil) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.width(width)
        if staxDebugOptions != nil {
            self.debug(staxDebugOptions!)
        }
    }
    
    /// Convenience init with height, optional backgroundColor and staxDebugOptions
    /// - Parameters:
    ///   - height: height
    ///   - backgroundColor: backgroundColor
    ///   - staxDebugOptions: staxDebugOptions
    convenience public init(height: CGFloat, backgroundColor: UIColor = .clear, staxDebugOptions: StaxDebugOptions? = nil) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.height(height)
        if staxDebugOptions != nil {
            self.debug(staxDebugOptions!)
        }
    }
    
    /// Convenience init with square side length, optional backgroundColor and staxDebugOptions
    /// - Parameters:
    ///   - square: square
    ///   - backgroundColor: backgroundColor
    ///   - staxDebugOptions: staxDebugOptions
    convenience public init(square: CGFloat, backgroundColor: UIColor = .clear, staxDebugOptions: StaxDebugOptions? = nil) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.square(square)
        if staxDebugOptions != nil {
            self.debug(staxDebugOptions!)
        }
    }
    
    /// Debugs the view
    /// - Parameter options: options
    /// - Returns: view
    @discardableResult
    public func debug<T: UIView>(_ options: StaxDebugOptions = StaxDebugOptionsType.adaptive) -> T {
        let debugView = StaxDebugView(options: options)
        self.addSubview(debugView)
        debugView.fillSuperview()
        self.layer.cornerRadius = options.cornerRadius
        self.layer.masksToBounds = true
        return self as! T
    }
}


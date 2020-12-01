//
//  ScrollView.swift
//  
//
//  Created by Alex Nagy on 29.11.2020.
//

import UIKit

@available(iOS 11.0, *)
public class ScrollView: UIScrollView {
    
    /// Scroll view axis
    var axis: NSLayoutConstraint.Axis = .vertical {
        didSet {
            stackViewWidthConstraint.isActive = (axis == .vertical)
            stackViewHeightConstraint.isActive = (axis == .horizontal)
        }
    }
    
    /// Content view
    private var content = UIView()
    /// Width constraint
    private var stackViewWidthConstraint = NSLayoutConstraint()
    /// Height constraint
    private var stackViewHeightConstraint = NSLayoutConstraint()
    
    /// Initializes a `UIScrolView` with a content view
    /// - Parameter content: content view
    public init(_ content: UIView) {
        super.init(frame: .zero)
        self.content = content
        configure(view: content)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Configures the scroll view with a content view
    /// - Parameter view: content
    private func configure(view: UIView) {

        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor)
            ])

        stackViewWidthConstraint = view.widthAnchor.constraint(equalTo: widthAnchor)
        stackViewHeightConstraint = view.heightAnchor.constraint(equalTo: heightAnchor)

        stackViewWidthConstraint.isActive = (axis == .vertical)
        stackViewHeightConstraint.isActive = (axis == .horizontal)
    }
    
    /// Sets the axis of the scroll view
    /// - Parameter axis: scroll view axis
    /// - Returns: scroll view
    @discardableResult
    public func axis(_ axis: NSLayoutConstraint.Axis) -> ScrollView {
        self.axis = axis
        return self
    }
    
    /// Sets the padding of the scroll view with `UIEdgeInsets`
    /// - Parameter insets: scroll view padding
    /// - Returns: scroll view
    @discardableResult
    public func padding(_ insets: UIEdgeInsets) -> ScrollView {
        contentInset = insets
        return self
    }
    
    /// Sets the padding of the scroll view with a constant
    /// - Parameter constant: scroll view padding constant
    /// - Returns: scroll view
    @discardableResult
    public func padding(by constant: CGFloat = 8) -> ScrollView {
        padding(UIEdgeInsets(top: constant, left: constant, bottom: constant, right: constant))
    }
    
    /// Sets the padding of the scroll view padding type with a constant
    /// - Parameters:
    ///   - type: padding type
    ///   - constant: scroll view padding constant
    /// - Returns: scroll view
    @discardableResult
    public func padding(_ type: PaddingType, _ constant: CGFloat = 8) -> ScrollView {
        switch type {
        case .leading:
            contentInset.left = constant
        case .trailing:
            contentInset.right = constant
        case .top:
            contentInset.top = constant
        case .bottom:
            contentInset.bottom = constant
        case .horizontal:
            contentInset.left = constant
            contentInset.right = constant
        case .vertical:
            contentInset.top = constant
            contentInset.bottom = constant
        }
        return self
    }
    
    /// Sets the bounces property of the scroll view
    /// - Parameter bounces: scroll view bounces
    /// - Returns: scroll view
    @discardableResult
    public func bounces(_ bounces: Bool = true) -> ScrollView {
        self.bounces = bounces
        return self
    }
    
    /// Sets the pages property of the scroll view
    /// - Parameter isPagingEnabled: scroll view bounces
    /// - Returns: scroll view
    @discardableResult
    public func pages(_ isPagingEnabled: Bool = true) -> ScrollView {
        self.isPagingEnabled = isPagingEnabled
        return self
    }
    
    /// Sets the showsScrollIndicator property of the scroll view
    /// - Parameter showsScrollIndicator: scroll view showsScrollIndicator
    /// - Returns: scroll view
    @discardableResult
    public func showsScrollIndicator(_ showsScrollIndicator: Bool = true) -> ScrollView {
        if axis == .horizontal {
            self.showsHorizontalScrollIndicator = showsScrollIndicator
        } else {
            self.showsVerticalScrollIndicator = showsScrollIndicator
        }
        return self
    }
    
    /// Hides the scroll indicator of the scroll view
    /// - Parameter hidesScrollIndicator: hides scroll indicator
    /// - Returns: scroll view
    @discardableResult
    public func hidesScrollIndicator(_ hidesScrollIndicator: Bool = true) -> ScrollView {
        showsScrollIndicator(!hidesScrollIndicator)
    }
    
    /// Lays out the view in a parent view woth safe area and padding
    /// - Parameters:
    ///   - view: the parent view
    ///   - withSafeArea: safe area
    ///   - padding: padding
    /// - Returns: scroll view
    @discardableResult
    public func layout(in view: UIView, withSafeArea: Bool = false, padding: UIEdgeInsets = .zero) -> ScrollView {
        view.addSubview(self)
        if withSafeArea {
            self.fillSuperviewSafeAreaLayoutGuide(padding: padding)
        } else {
            self.fillSuperview(padding: padding)
        }
        return self
    }
    
    /// Centers a view inside a parent view with a size and offset
    /// - Parameters:
    ///   - view: parent view
    ///   - size: size of the view
    ///   - offset: offset of the view
    /// - Returns: scroll view
    @discardableResult
    public func center(inside view: UIView, size: CGSize = .zero, offset: CGPoint = .zero) -> ScrollView {
        view.addSubview(self)
        centerInSuperview(size: size, offset: offset)
        return self
    }
    
    /// Sets the background color of the scroll view
    /// - Parameter color: color
    /// - Returns: scroll view
    @discardableResult
    public func background(color: UIColor) -> ScrollView {
        self.backgroundColor = color
        return self
    }
    
    /// Scrolls to a specified view on a specified axis
    /// - Parameters:
    ///   - view: the view to scroll to
    ///   - axis: scroll view axis
    ///   - offset: offset of the scroll
    ///   - delay: delay of the scroll
    ///   - animated: animation of the scroll
    /// - Returns: scroll view
    @discardableResult
    public func scroll(to view: UIView, axis: NSLayoutConstraint.Axis, offset: CGFloat = 0, delay: Double = 0, animated: Bool = true) -> ScrollView {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            if let origin = view.superview {
                let childStartPoint = origin.convert(view.frame.origin, to: self)
                switch axis {
                case .horizontal:
                    self.setContentOffset(CGPoint(x: childStartPoint.x - self.contentInset.left - offset, y: 0), animated: true)
                case .vertical:
                    self.setContentOffset(CGPoint(x: 0, y: childStartPoint.y - self.contentInset.top - offset), animated: true)
                @unknown default:
                    print("@unknown default")
                }
            }
        }
        return self
    }
    
    /// Scrolls to a specified edge of the scroll view
    /// - Parameters:
    ///   - scrollToType: scroll to type
    ///   - delay: delay of the scroll
    ///   - animated: animation of the scroll
    /// - Returns: scroll view
    @discardableResult
    public func scroll(_ scrollToType: ScrollToType, delay: Double = 0, animated: Bool = true) -> ScrollView {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            switch scrollToType {
            case .toLeft:
                let offset = CGPoint(x: -self.contentInset.left, y: 0)
                self.setContentOffset(offset, animated: animated)
            case .toRigh:
                let offset = CGPoint(x: self.contentSize.width - self.bounds.size.width + self.contentInset.right, y: 0)
                if offset.x > 0 {
                    self.setContentOffset(offset, animated: animated)
                }
            case .toTop:
                let offset = CGPoint(x: 0, y: -self.contentInset.top)
                self.setContentOffset(offset, animated: animated)
            case .toBottom:
                let offset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height + self.contentInset.bottom)
                if offset.y > 0 {
                    self.setContentOffset(offset, animated: animated)
                }
            }
        }
        return self
    }
}


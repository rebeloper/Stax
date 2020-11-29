//
//  ScrollView.swift
//  
//
//  Created by Alex Nagy on 29.11.2020.
//

import UIKit

@available(iOS 11.0, *)
public class ScrollView: UIScrollView {
    
    var axis: NSLayoutConstraint.Axis = .vertical {
        didSet {
            stackViewWidthConstraint.isActive = (axis == .vertical)
            stackViewHeightConstraint.isActive = (axis == .horizontal)
        }
    }
    
    private var content = UIView()
    private var stackViewWidthConstraint = NSLayoutConstraint()
    private var stackViewHeightConstraint = NSLayoutConstraint()
    
    public init(_ content: UIView) {
        super.init(frame: .zero)
        self.content = content
        configure(view: content)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    @discardableResult
    public func axis(_ axis: NSLayoutConstraint.Axis) -> ScrollView {
        self.axis = axis
        return self
    }
    
    @discardableResult
    public func padding(_ insets: UIEdgeInsets) -> ScrollView {
        contentInset = insets
        return self
    }
    
    @discardableResult
    public func padding(by constant: CGFloat) -> ScrollView {
        padding(UIEdgeInsets(top: constant, left: constant, bottom: constant, right: constant))
    }
    
    @discardableResult
    public func padding(_ type: PaddingType, _ constant: CGFloat) -> ScrollView {
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
    
    @discardableResult
    public func bounces(_ bounces: Bool = true) -> ScrollView {
        self.bounces = bounces
        return self
    }
    
    @discardableResult
    public func pages(_ isPagingEnabled: Bool = true) -> ScrollView {
        self.isPagingEnabled = isPagingEnabled
        return self
    }
    
    @discardableResult
    public func showsScrollIndicator(_ showsScrollIndicator: Bool = true) -> ScrollView {
        if axis == .horizontal {
            self.showsHorizontalScrollIndicator = showsScrollIndicator
        } else {
            self.showsVerticalScrollIndicator = showsScrollIndicator
        }
        return self
    }
    
    @discardableResult
    public func hidesScrollIndicator(_ hidesScrollIndicator: Bool = true) -> ScrollView {
        showsScrollIndicator(!hidesScrollIndicator)
    }
    
    @discardableResult
    public func layout(in view: UIView, withSafeArea: Bool = false, padding: UIEdgeInsets = .zero) -> UIScrollView {
        view.addSubview(self)
        if withSafeArea {
            self.fillSuperviewSafeAreaLayoutGuide(padding: padding)
        } else {
            self.fillSuperview(padding: padding)
        }
        return self
    }
    
    @discardableResult
    public func center(inside superView: UIView, size: CGSize = .zero, offset: CGPoint = .zero) -> ScrollView {
        superView.addSubview(self)
        centerInSuperview(size: size, offset: offset)
        return self
    }
    
    @discardableResult
    public func background(color: UIColor) -> ScrollView {
        self.backgroundColor = color
        return self
    }
}


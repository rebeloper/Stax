//
//  UIStackView+.swift
//  
//
//  Created by Alex Nagy on 29.11.2020.
//

import UIKit

@available(iOS 11.0, *)
extension UIStackView {
    
    @discardableResult
    public func padding(_ insets: UIEdgeInsets) -> UIStackView {
        layoutMargins = insets
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    public func padding(by constant: CGFloat) -> UIStackView {
        padding(UIEdgeInsets(top: constant, left: constant, bottom: constant, right: constant))
    }
    
    @discardableResult
    public func padding(_ type: PaddingType, _ constant: CGFloat) -> UIStackView {
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
    
    @discardableResult
    public func center(inside superView: UIView, size: CGSize = .zero, offset: CGPoint = .zero) -> UIStackView {
        superView.addSubview(self)
        centerInSuperview(size: size, offset: offset)
        return self
    }
    
    @discardableResult
    func layout(in view: UIView, withSafeArea: Bool = false, padding: UIEdgeInsets = .zero) -> UIStackView {
        view.addSubview(self)
        if withSafeArea {
            self.fillSuperviewSafeAreaLayoutGuide(padding: padding)
        } else {
            self.fillSuperview(padding: padding)
        }
        return self
    }
    
    @discardableResult
    public func scrolls(_ axis: NSLayoutConstraint.Axis = .vertical) -> ScrollView {
        let scrollView = ScrollView(self)
        scrollView.axis(axis)
        return scrollView
    }
    
    @discardableResult
    public func background(color: UIColor) -> UIStackView {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
        return self
    }
}

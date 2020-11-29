//
//  Stax.swift
//  
//
//  Created by Alex Nagy on 29.11.2020.
//

import UIKit

/// Vertical Stack containing an array of views
/// - Parameter views: views
/// - Returns: stack view
@available(iOS 11.0, *)
public func VStack(_ views: UIView...) -> UIStackView {
    UIView().vstack(views)
}

/// Horizontal Stack containing an array of views
/// - Parameter views: views
/// - Returns: stack view
@available(iOS 11.0, *)
public func HStack(_ views: UIView...) -> UIStackView {
    UIView().hstack(views)
}

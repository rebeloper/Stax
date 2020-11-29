//
//  Stax.swift
//  
//
//  Created by Alex Nagy on 29.11.2020.
//

import UIKit

@available(iOS 11.0, *)
public func VStack(_ views: UIView...) -> UIStackView {
    UIView().vstack(views)
}

@available(iOS 11.0, *)
public func HStack(_ views: UIView...) -> UIStackView {
    UIView().hstack(views)
}

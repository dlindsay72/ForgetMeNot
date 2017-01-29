//
//  CustomTextField.swift
//  ForgetMeNot
//
//  Created by Dan Lindsay on 2017-01-28.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit

@IBDesignable

class CustomTextField: UITextField {
    
    @IBInspectable var inset: CGFloat = 0
    
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: inset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
//    override func awakeFromNib() {
//        self.layer.cornerRadius = 5.0
//    }
    
//    override func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
//        setupView()
//    }
//    
//    func setupView() {
//        self.layer.cornerRadius = cornerRadius
//    }
}

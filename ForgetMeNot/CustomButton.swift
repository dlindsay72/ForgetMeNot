//
//  CustomButton.swift
//  ForgetMeNot
//
//  Created by Dan Lindsay on 2017-01-28.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit

@IBDesignable

class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var fontColor: UIColor = UIColor.white {
        didSet {
            self.tintColor = fontColor
        }
    }
}

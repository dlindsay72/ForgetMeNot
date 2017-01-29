//
//  CustomButton.swift
//  ForgetMeNot
//
//  Created by Dan Lindsay on 2017-01-28.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit
import pop

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
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(CustomButton.scaleToSmall), for: .touchDown)
        self.addTarget(self, action: #selector(CustomButton.scaleToSmall), for: .touchDragEnter)
        self.addTarget(self, action: #selector(CustomButton.scaleAnimation), for: .touchUpInside)
        self.addTarget(self, action: #selector(CustomButton.scaleDefault), for: .touchDragExit)
        
    }
    
    func scaleToSmall() {
        if let scaleAnim = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY) {
            scaleAnim.toValue = NSValue.init(cgSize: CGSize(width: 0.95, height: 0.95))
            self.layer.pop_add(scaleAnim, forKey: "layerScaleSmallAnimation")
        }
    }
    
//    func scaleAnimation() {
//        let scaleAnim = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)!
//        scaleAnim.velocity = NSValue.init(cgSize: CGSize(width: 10.0,height: 10.0))
//        scaleAnim.toValue = NSValue.init(cgSize: CGSize(width: 1.0,height: 1.0))
//        scaleAnim.springBounciness = 18
//        self.layer.pop_add(scaleAnim, forKey: "layerScaleSpringAnimation")
//    }
    
    func scaleAnimation() {
        if let scaleAnim = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY) {
            scaleAnim.velocity = NSValue.init(cgSize: CGSize(width: 3.0, height: 3.0))
            scaleAnim.toValue = NSValue.init(cgSize: CGSize(width: 1.0, height: 1.0))
            scaleAnim.springBounciness = 18
            self.layer.pop_add(scaleAnim, forKey: "layerScaleSpringAnimation")
        }
        
    }
    
    func scaleDefault() {
        if let scaleAnim = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY) {
            scaleAnim.toValue = NSValue.init(cgSize: CGSize(width: 1, height: 1))
            self.layer.pop_add(scaleAnim, forKey: "layerScaleDefaultAnimation")
        }
    }
}

//
//  Card.swift
//  ForgetMeNot
//
//  Created by Dan Lindsay on 2017-01-30.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
// All images from FreePik.com

import UIKit

@IBDesignable

class Card: UIView {

    let shapes = ["shape1", "shape2", "shape3"]
    var currentshape: String!
    
    @IBOutlet weak var shapeImage: UIImageView!
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    override func awakeFromNib() {
        setupView()
        selectShape()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowColor = UIColor(red: 157.0/255.0, green: 157.0/255.0, blue: 157.0/255.0, alpha: 1.0).cgColor
        self.setNeedsLayout()
    }
    
    func selectShape() {
        currentshape = shapes[Int(arc4random_uniform(3))]
        shapeImage.image = UIImage(named: currentshape)
    }

}

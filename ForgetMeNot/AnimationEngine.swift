//
//  AnimationEngine.swift
//  ForgetMeNot
//
//  Created by Dan Lindsay on 2017-01-29.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit
import pop

class AnimationEngine {
    
    
    class var offScreenRightPosition: CGPoint {
        return CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.midY)
    }
    
    class var offScreenLeftPosition: CGPoint {
        return CGPoint(x: -UIScreen.main.bounds.width, y: UIScreen.main.bounds.midY)
    }
    
    class var screenCenterPosition: CGPoint {
        return CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
    }
    
    let ANIM_DELAY = 0.8
    var originalConstants = [CGFloat]()
    var constraints: [NSLayoutConstraint]!
    
    init(constraints: [NSLayoutConstraint]) {
        
        for con in constraints {
            originalConstants.append(con.constant)
            con.constant = AnimationEngine.offScreenRightPosition.x
        }
        
        self.constraints = constraints
    }
    
    func animateOnScreen(delay: Double?) {
        
      
        let time = DispatchTime.now() + (delay ?? ANIM_DELAY)
        
        DispatchQueue.main.asyncAfter(deadline: time) { 
            var index = 0
            repeat {
                if let moveAnim = POPSpringAnimation(propertyNamed: kPOPLayoutConstraintConstant) {
                    moveAnim.toValue = self.originalConstants[index]
                    moveAnim.springBounciness = 15
                    moveAnim.springSpeed = 15
                    
                    if (index > 0) {
                        moveAnim.dynamicsFriction += 2 + CGFloat(index)
                    }
                    
                    let con = self.constraints[index]
                    con.pop_add(moveAnim, forKey: "moveOnScreen")
                    index += 1
                }
            } while (index < self.constraints.count)
        }
    }
    
}





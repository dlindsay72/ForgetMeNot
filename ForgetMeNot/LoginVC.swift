//
//  LoginVC.swift
//  ForgetMeNot
//
//  Created by Dan Lindsay on 2017-01-28.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit
import pop


class LoginVC: UIViewController {
    
    @IBOutlet weak var emailConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginConstraints: NSLayoutConstraint!
    
    var animEngine: AnimationEngine!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.animEngine = AnimationEngine(constraints: [emailConstraint, passwordConstraint, loginConstraints])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.animEngine.animateOnScreen(delay: 1.5)
    }


}


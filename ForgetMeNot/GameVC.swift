//
//  GameVC.swift
//  ForgetMeNot
//
//  Created by Dan Lindsay on 2017-01-29.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit
import pop

class GameVC: UIViewController {
    
    @IBOutlet weak var yesBtn: CustomButton!
    @IBOutlet weak var noBtn: CustomButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    
    var currentCard: Card!
    var previousCard: Card!
    var totalTime = 59
    var countdownTimer: Timer!
    var correctGuesses = 0
    var incorrectGuesses = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        currentCard = createCardFromNib()
        currentCard.center = AnimationEngine.screenCenterPosition
        self.view.addSubview(currentCard)
        
        
    }
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func endTimer() {
        countdownTimer.invalidate()
    }
    
    func updateTime() {
        timerLbl.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            countdownTimer.invalidate()
        }
    }
    
    func createCardFromNib() -> Card? {
        var newCard = Card()
        if let card = Bundle.main.loadNibNamed("Card", owner: self, options: nil)?[0] as? Card {
           newCard = card
        }
        return newCard
        
    }
    
    @IBAction func yesPressed(sender: UIButton) {
        
        if sender.titleLabel?.text == "YES" {
            checkAnswer()
        } else {
            titleLbl.text = "Does this card match the previous?"
            startTimer()
            
        }
        showNextCard()
    }
    
    
    @IBAction func noPressed(sender: UIButton) {
        checkAnswer()
        showNextCard()
    }
    
    func showNextCard() {
        
        if let current = currentCard {
            let cardToRemove = current
            //will have to do some logic to store which card we choose before we set the currentCard to nil
            currentCard = nil
            
            
            
            AnimationEngine.animateToPosition(cardToRemove, position: AnimationEngine.offScreenLeftPosition, completion: { (anim: POPAnimation?, finished: Bool) in
                cardToRemove.removeFromSuperview()
            })
        }
        
        if let next = createCardFromNib() {
            next.center = AnimationEngine.offScreenRightPosition
            self.view.addSubview(next)
            currentCard = next
            
            if noBtn.isHidden {
                noBtn.isHidden = false
                yesBtn.setTitle("YES", for: .normal)
            }
            
            AnimationEngine.animateToPosition(next, position: AnimationEngine.screenCenterPosition, completion: { (anim: POPAnimation?, finished: Bool) in
                
            })
        }
        
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func checkAnswer() {
        
    }
    
    func endGame() {
        
    }
    
    func replay() {
        
    }

    

}

//
//  ViewController.swift
//  TicTacToe
//
//  Created by Malik Adebiyi on 2020-05-08.
//  Copyright © 2020 dot.sandbox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var winnerLabel: UILabel!
  
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        
         activeGame = true
        
         activePlayer = 1
        
         gameState = [0,0,0,0,0,0,0,0,0]
        
                 
        for i in 1..<10 {
           if let button = view.viewWithTag(i) as?  UIButton {
            
            button.setImage(nil, for:[])
                
            }
            winnerLabel.isHidden = true
            playAgainButton.isHidden = true
            
            winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
            
            playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        }
    }
    // 1 is nought, 2 is crosses
    
    var activeGame = true
    
    var activePlayer = 1
    
    var gameState = [0,0,0,0,0,0,0,0,0] // 0 - empty 1 - nought, 2 - crosses
    
    let winningCombo = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }
 
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let  activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
              
                
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
                
            }
            
            for combo in winningCombo {
                if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] {
                    
                    // wininng combination
                    
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combo[0]] == 1 {
                        winnerLabel.text = "O has won!"
                    } else {
                        winnerLabel.text = "X has won!"

                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x - 500, y: self.winnerLabel.center.y)
                        
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x - 500, y: self.playAgainButton.center.y)
                    })
                    
                }
            }
        }
 
    }
    
    
}


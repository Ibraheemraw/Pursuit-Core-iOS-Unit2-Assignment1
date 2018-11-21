//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //myOutlets
    @IBOutlet var myGameBttns: [GameButton]!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var Outcome: UILabel!
    
    //variables&Constants
    var brain: TicTacToeBrain = TicTacToeBrain()
    override func viewDidLoad() {
    super.viewDidLoad()
  }
    @IBAction func userPressedBttn(_ sender: GameButton){
       let playersTurn = brain.plyrsTurn
        sender.setImage(playersTurn.image(), for: .normal)
        brain.updateTheBrain(row: sender.row, col: sender.col)
        print(brain.checkToSeeWhoWon())
        switch brain.checkToSeeWhoWon() {
            case .player1Wins:
                Outcome.text = "You Win Player 1!!!"
                myGameBttns.forEach{ button in button.isEnabled = false }
            case .player2Wins:
                Outcome.text = "You Win Player 2!!!"
                myGameBttns.forEach{ button in button.isEnabled = false }
            case .tieBetweenPlyrs:
                Outcome.text = "Looks like it is a tie"
                myGameBttns.forEach{ button in button.isEnabled = false }
            case .gameStillInprogress:
               print("In Progress")
        }
        sender.isEnabled = false
        score.text = "Player 1: \(player1IsTheWinner) -- Player 2: \(player2IsTheWinner)"
    }
    @IBAction func startOver(_ sender: GameButton){
        brain.ticTacToeBoard = [[BoxOnBoard]](repeating: [BoxOnBoard](repeating: .empty, count: 3), count: 3)
        myGameBttns.forEach{$0.isEnabled = true}
        myGameBttns.forEach{ myButton in myButton.setImage(UIImage(), for: .normal)}
        brain.plyrsTurn = .player1
        player1IsTheWinner = 0
        player2IsTheWinner = 0
        score.text = "Player 1: \(player1IsTheWinner) -- Player 2: \(player2IsTheWinner)"
        Outcome.text = "Let Play Tic Tac Toe"
    }
}


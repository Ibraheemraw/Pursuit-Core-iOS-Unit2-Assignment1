//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

enum BoxOnBoard {
    case x, o, empty
}
 var player1IsTheWinner = 0
 var player2IsTheWinner = 0
 var theGameEndsInATie = 0
enum WhosTurn: String, CaseIterable {
    case player1
    case player2
    func image() -> UIImage {
        var bttnImg: UIImage!
        switch self {
        case .player1:
            bttnImg = UIImage(named: "x-button")
        case .player2:
            bttnImg = UIImage(named: "circle-button")
        }
        return bttnImg
    }
    mutating func togglePlayers(){
        switch self {
        case .player1: self = .player2
        case .player2: self = .player1
        }
    }
}
enum CurrentStageOfTheGame {
    case player1Wins, player2Wins, tieBetweenPlyrs, gameStillInprogress
}
class TicTacToeBrain {
  var plyrsTurn = WhosTurn.player1
    var ticTacToeBoard = [[BoxOnBoard]](repeating: [BoxOnBoard](repeating: .empty, count: 3), count: 3)
    func updateTheBrain(row: Int, col: Int){
        let position: BoxOnBoard
        switch plyrsTurn {
        case .player1: position = .x
        case .player2: position = .o
        }
        ticTacToeBoard[row][col] = position
        print(ticTacToeBoard)
        plyrsTurn.togglePlayers()
    }
    func checkToSeeWhoWon() -> CurrentStageOfTheGame {
        //looking for who wins by the rows on the game board
        for row in ticTacToeBoard {
            if row == [.x, .x, .x] {
                player1IsTheWinner += 1
                return .player1Wins
            } else if row == [.o,.o,.o] {
                player2IsTheWinner += 1
                return .player2Wins
            }
        }
      //looking for who wins by the coloumns on the game board
        for outterArr in 0..<ticTacToeBoard[0].count{
            var gameColumn = [BoxOnBoard]()
            for innerArr in 0..<ticTacToeBoard[0].count {
                gameColumn.append(ticTacToeBoard[outterArr][innerArr])
                if gameColumn == [.x, .x, .x] {
                    player1IsTheWinner += 1
                    return .player1Wins
                } else if gameColumn == [.o, .o, .o] {
                    player2IsTheWinner += 1
                    return .player2Wins}
            }
        }
        //looking for who wins diagonly on the game board
         var firstDiagonalLine = [BoxOnBoard]()
         var secondDiagonalLine = [BoxOnBoard]()
        for value in 0..<ticTacToeBoard.count{
            firstDiagonalLine.append(ticTacToeBoard[value][value])
        }
        if firstDiagonalLine == [.x,.x,.x] {
            player1IsTheWinner += 1
            return .player1Wins
        } else if  firstDiagonalLine == [.o, .o, .o] {
            player2IsTheWinner += 1
            return .player2Wins}
        for value2 in 0..<ticTacToeBoard.count{
            secondDiagonalLine.append(ticTacToeBoard[value2][ticTacToeBoard.count - 1 - value2])
        }
        if secondDiagonalLine == [.x,.x,.x] {
            player1IsTheWinner += 1
            return .player1Wins
        } else if  secondDiagonalLine == [.o, .o, .o] {
            player2IsTheWinner += 1
            return .player2Wins}
        return .gameStillInprogress
        
    }
}

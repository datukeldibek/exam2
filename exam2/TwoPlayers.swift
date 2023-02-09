//
//  TwoPlayers.swift
//  exam2
//
//  Created by Jarae on 9/2/23.
//

import Foundation
class TwoPlayers: Game, Menu {
    func startGame() {
        var flag = false, queue = false
        var winner = ""
        var count = 0
        while flag == false{
            show()
            if queue == false {          //false - player1, true - player2
                move(player: "player1", sign: x)
                check(sign: x) == true ? (flag = true) : (flag = false)
                
            }else{
                move(player: "player2", sign: o)
                check(sign: o) == true ? (flag = true) : (flag = false)
            }
            queue == false ? (winner = "player1") : (winner = "player2")
            queue == false ? (queue = true) : (queue = false)
            count += 1
            if count == 9 && flag == false{
                flag = true
                winner = "draw"
            }
            endGame(winner)
        }
        
    }
    func endGame(_ winner: String) {
        show()
        winner == "draw" ? print("DRAW") : print("Winner is \(winner), congrats!")
    }
}

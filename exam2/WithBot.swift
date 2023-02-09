//
//  WithBot.swift
//  exam2
//
//  Created by Jarae on 9/2/23.
//

import Foundation
class WithBot: Game, Menu  {
    func startGame() {
        var flag = false, queue = false
        var winner = ""
        var count = 0
        while flag == false{
            show()
            if queue == false {          //false-you, true-bot
                move(player: "you", sign: x)
                check(sign: x) == true ? (flag = true) : (flag = false)
                
            }else{
                move(player: "bot", sign: o)
                check(sign: o) == true ? (flag = true) : (flag = false)
            }
            queue == false ? (winner = "you") : (winner = "bot")
            queue == false ? (queue = true) : (queue = false)
            count += 1
            if count == 9 && flag == false {
                flag = true
                winner = "draw"
            }
        }
        endGame(winner)
    }
    func endGame(_ winner: String) {
        show()
        winner == "draw" ? print("DRAW") : print("Winner is \(winner), congrats!")
        
    }
}

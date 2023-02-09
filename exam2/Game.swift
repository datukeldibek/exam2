//
//  Game.swift
//  exam2
//
//  Created by Jarae on 9/2/23.
//

import Foundation
class Game {
    var array: [[String]] = [[FieldType.empty.rawValue, FieldType.empty.rawValue, FieldType.empty.rawValue],
                             [FieldType.empty.rawValue, FieldType.empty.rawValue, FieldType.empty.rawValue],
                             [FieldType.empty.rawValue, FieldType.empty.rawValue, FieldType.empty.rawValue]]
    
    var o = FieldType.o.rawValue
    var x = FieldType.x.rawValue
    
    func show() {
        for line in array {
            var lineString = ""
            for character in line {
                lineString += character + "\t"
            }
            print(lineString)
        }
    }
    func game() {
        print("choose second player: a - your friend | b - bot ")
        let answer = readLine()!
        if answer == "a"{
            TwoPlayers().startGame()
        }else if answer == "b"{
            WithBot().startGame()
        }
    }
    func check(sign: String) -> Bool{  // если хоть какая то линия заполнена
        var wonOrNot = false
        
        for (i, row) in array.enumerated(){
            var flag = true
            for (j, _) in row.enumerated(){
                if array[i][j] != sign{
                    flag = false
                }
            }
            if flag == true{
                wonOrNot = true
                break;
            }
        }
        if wonOrNot == false {
            for (i, row) in array.enumerated(){
                var flag = true
                for (j, _) in row.enumerated(){
                    if array[j][i] != sign{
                        flag = false
                    }
                }
                if flag == true{
                    wonOrNot = true
                    break;
                }
            }
        }
        if wonOrNot == false {
            if array[0][0] == sign && array[1][1] == sign && array[2][2] == sign{
                wonOrNot = true
            }else if array[0][0] == sign && array[1][1] == sign && array[2][2] == sign {
                wonOrNot = true
            }
        }
        return wonOrNot
    }
    func move(player: String, sign: String){
        player == "you" ? print("your turn") : print("\(player)'s turn")
        var isOk = false         //is index not out of the range test
        while isOk == false{
            if player == "bot" {
                let row = Int.random(in: 0..<3)
                let col = Int.random(in: 0..<3)
                if array[row][col] == FieldType.empty.rawValue{
                    array[row][col] = o
                    isOk = true
                    
                }
            }else {
                let row = readLine()!
                let col = readLine()!
                if Int(row)! < 3 && Int(col)! < 3 && array[Int(row)!][Int(col)!] == FieldType.empty.rawValue{
                    array[Int(row)!][Int(col)!] = sign
                    isOk = true
                }else{
                    print("please, try again")
                }
            }
            
        }
        
    }
}

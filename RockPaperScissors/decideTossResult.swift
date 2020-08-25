//
//  decideTossResult.swift
//  RockPaperScissors
//
//  Created by 林祐辰 on 2020/8/24.
//
import Foundation
import GameKit

// 產生 0~3 的隨機數
let randomToss = GKRandomDistribution(lowestValue: 0, highestValue: 3)

func decideToss()->Toss{
 //   nextInt() 是 GKRandomDistribution方法中要呼叫隨機數的方法
    let tossResult = randomToss.nextInt()
    
    switch tossResult{
    case 0:
        return .up
    case 1:
        return .down
    case 2:
        return .left
    default :
        return .right
    }
}

enum Toss{
    case up,down,left,right
    
    
   // enum 是型別的一種 , 所以能在型別裡設定屬性
   // 宣告屬性為字串 , 而因為在Swift裡遇到{} (block) 會馬上執行 也因為我們宣告屬性是字串, 所以我們會回字串
    var emoji:String{
      // 這裡的 self都是指Enum型別
        switch self {
        case .up:
            return "👆"
        case .down:
            return "👇"
        case .left:
            return "👈"
        case .right:
            return "👉"
        }
    }
    
    // 這一function 是要比手指方向是否相同來判斷玩家輸／贏
    func takeTurns(_ otherPlayer:Toss)->GameResult{
        switch self {
        case .up:
          switch otherPlayer{
           case .up:
            return GameResult.win
           case .down:
            return GameResult.lose
           case .left:
            return GameResult.lose
           case .right:
            return GameResult.lose
          }
        case .down:
          switch otherPlayer{
          case .up:
            return GameResult.lose
          case .down:
            return GameResult.win
          case .left:
            return GameResult.lose
          case .right:
            return GameResult.lose
          }
        case .left:
          switch otherPlayer{
          case .up:
            return GameResult.lose
          case .down:
            return GameResult.lose
          case .left:
            return GameResult.win
          case .right:
            return GameResult.lose
          }
        case .right:
        switch otherPlayer{
          case .up:
            return GameResult.lose
          case .down:
            return GameResult.lose
          case .left:
            return GameResult.lose
          case .right:
            return GameResult.win
        }
        }
    }
}

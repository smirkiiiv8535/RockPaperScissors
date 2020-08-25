//
//  decideRockPaperResult.swift
//  RockPaperScissors
//
//  Created by 林祐辰 on 2020/8/24.
//

import Foundation

import Foundation
import GameKit

let randomNumber = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func roll() -> GestureSign{
    let numberResult = randomNumber.nextInt()
    
    switch numberResult{
     case 0:
        return .rock
     case 1:
        return .paper
    default :
        return .scissors
        
    }
    
}

enum GestureSign{
    case rock,paper,scissors
    
    
    var sign:String{
        switch self{
        case .rock :
          return "✊"
        case .paper :
          return "✋"
        case .scissors :
          return "✌️"
        }
    }
    
    
    func changePlayerToCpu(_ cpuDecision:GestureSign)->GameResult{
        switch self{
        case .rock :
            switch cpuDecision {
            case .rock:
                return GameResult.draw
            case .paper:
                return GameResult.lose
            case .scissors:
                return GameResult.win
            }
        case .paper :
            switch cpuDecision {
            case .rock:
                return GameResult.win
            case .paper:
                return GameResult.draw
            case .scissors:
                return GameResult.lose
            }
        case .scissors :
            switch cpuDecision {
            case .rock:
                return GameResult.lose
            case .paper:
                return GameResult.win
            case .scissors:
                return GameResult.draw
            }
        }
        
    }
}

//
//  FLIPGAME.swift
//  StudyMaterial
//
//  Created by Jeevith  on 14/02/25.
//

import Foundation
enum CoinImage: String {
    case head = "head"
    case tail = "tail"
}

class CoinFlipGame {
    private static let coinSides: [String] = ["Head", "Tail"]
    
    func flipCoin(userChoice: String) {
        let randomResult = CoinFlipGame.getRandomCoinSide()
        
        if userChoice == randomResult {
            print("You Won! It is a \(userChoice)")
        } else {
            print("You Lost! It is a \(randomResult)")
        }
    }
    
    private static func getRandomCoinSide() -> String {
        return CoinFlipGame.coinSides.randomElement()!
    }
}

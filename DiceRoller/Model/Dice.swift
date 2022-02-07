//
//  Dice.swift
//  DiceRoller
//
//  Created by Amit Shrivastava on 04/02/22.
//

import Foundation
import SwiftUI

struct Dice: Codable, Identifiable {
   
    var id = UUID()
    var type: Int = 0
    var number: Int = 0
    var rolls  = [Int]()
    
    init(type: Int , number: Int) {
        self.type = type
        self.number = number
        for _ in 0..<number {
            let roll = Int.random(in: 1...type)
            rolls.append(roll)
        }
    }


    
}

//
//  DiceViewModel.swift
//  DiceRoller
//
//  Created by Amit Shrivastava on 05/02/22.
//

import Foundation
import SwiftUI

enum CodingKeys: CodingKey {
    case diceFun
}

class DiceViewModel: ObservableObject {
    @Published var maxNumberonDice: Int = 0
    @Published var numberOfDice: Int = 0
    @Published var randomNumbers = [Int]()
//    @Published var diceFun: Dice
//    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        diceFun = try container.decode(Dice.self
//            , forKey: .diceFun)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(diceFun, forKey: .diceFun)
//    }
}

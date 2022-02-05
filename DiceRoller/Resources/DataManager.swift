//
//  DataManager.swift
//  DiceRoller
//
//  Created by Amit Shrivastava on 04/02/22.
//

import Foundation
import SwiftUI

struct DataManager {
    static let savePath = FileManager.getDocumentsDirectory.appendingPathComponent("DiceData")
    
    static func loadData() -> [Dice] {
        if let data  = try? Data(contentsOf: savePath) {
            if  let decoded = try?  JSONDecoder().decode([Dice].self, from: data) {
                return decoded
            }
        }
        return []
        
    }
    
    static func save(_ dices: [Dice]) {
        if let data = try? JSONEncoder().encode(dices) {
            try? data.write(to: savePath, options: [.atomic, .completeFileProtection])
        }
    }
    
    
}

//
//  FileManager_Extension.swift
//  DiceRoller
//
//  Created by Amit Shrivastava on 04/02/22.
//

import Foundation


extension FileManager {
    static var getDocumentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

//
//  ShowResults.swift
//  DiceRoller
//
//  Created by Amit Shrivastava on 06/02/22.
//

import SwiftUI

struct ShowResults: View {
    @State var dices = DataManager.loadData()
    var body: some View {
        NavigationView {
        List {
            ForEach(dices) { item in
                HStack {
                    Text("DSides \(item.type)")
                       
                    Text("Max Number \(item.number)")
                        
                    Text("Total \(item.rolls.reduce(0, + ))")
                        
                }
            }
        }
        .navigationTitle("Old results")
        }
    }
}

struct ShowResults_Previews: PreviewProvider {
    static var previews: some View {
        ShowResults()
    }
}

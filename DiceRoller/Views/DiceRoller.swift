//
//  ContentView.swift
//  DiceRoller
//
//  Created by Amit Shrivastava on 04/02/22.
//

import SwiftUI

struct DiceRoller: View {

    let columns = [
               GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible()),
       ]
    
   @State private var number = 6
   @State private var type = (1...10).map { _ in Int.random(in: 1...10)}
   @State var total = [Int]()
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0..<number, id: \.self) { item in
                
                DiceView(randomRoll: $type[item])
                    .onAppear {
                        total.append(type[item])
                    }
 
                }
            
            Text("\(total.reduce(0, +))")
            
                    }
      
        .padding(.horizontal)
    }
}

struct DiceRoller_Previews: PreviewProvider {
    static var previews: some View {
        DiceRoller()
    }
}

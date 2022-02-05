//
//  DiceView.swift
//  DiceRoller
//
//  Created by Amit Shrivastava on 04/02/22.
//

import SwiftUI

struct DiceView: View {
    let randomNumber = Int.random(in: 400...1000)
 //   @State  var randomRoll = Int.random(in: 1...6)
    @Binding var randomRoll: Int
    
    var body: some View {
     
            GeometryReader { geo in
                Text("\(randomRoll)")
                    .font(.title)
                    .padding(.horizontal)
                    .background(
                Rectangle()
                        .foregroundColor(Color(hue: min(1, geo.frame(in: .global).minY/CGFloat(randomNumber) ), saturation: 1, brightness: 1))
                        .frame(minWidth: 100, minHeight: 100)
                    .cornerRadius(10))
            
            }
        .frame(height: 120)
    }

}

struct DiceView_Previews: PreviewProvider {
    @State static var roll = 1
    static var previews: some View {
        DiceView(randomRoll: $roll)
    }
}

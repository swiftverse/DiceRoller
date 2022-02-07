//
//  DiceView.swift
//  DiceRoller
//
//  Created by Amit Shrivastava on 04/02/22.
//

import SwiftUI

struct DiceView: View {
    let randomNumber = Int.random(in: 400...1000)
    @Binding var randomRoll: Int
   
    var body: some View {
        GeometryReader { geo in
                Text("\(randomRoll)")
                    .font(.title)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity) 
                    .background(
                        Rectangle()
                            .foregroundColor(Color(hue: min(1, geo.frame(in: .global).minY/CGFloat(randomNumber) ), saturation: 1, brightness: 1))
                            .cornerRadius(10))
                
            }
            .frame(height: 150)
    }

}

struct DiceView_Previews: PreviewProvider {
    @State static var roll = 1
    static var previews: some View {
        DiceView(randomRoll: $roll)
    }
}

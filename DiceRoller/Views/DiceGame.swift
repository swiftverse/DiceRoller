//
//  DiceGame.swift
//  DiceRoller
//
//  Created by Amit Shrivastava on 05/02/22.
//

import SwiftUI

struct DiceGame: View {
    let columns = [
               GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible()),
       ]
    
    @ObservedObject var dice:  DiceViewModel
    @State var total = [Int]()
    @State var dices = DataManager.loadData()
    @State var timer = Timer.publish(every: 0.1,  on: .main, in: .common ).autoconnect()
    
    @State var showStopButton = false
    @State var diceData = Dice(type: 0, number: 0)
    
    init(dice: DiceViewModel) {
        self.dice = dice
        _diceData = State(initialValue: Dice(type: dice.maxNumberonDice, number: dice.numberOfDice))
    }
    var body: some View {
        VStack {
            Button("Start Roll") {
                startTimer()               
            }
            
            
            Button("Stop Roll"){
                stopTimer()
                    dices.append(diceData)
              

                        DataManager.save(dices)
            }
           
           
            
            Text("Total - \(diceData.rolls.reduce(0, +))")
                .font(.largeTitle)
                .padding(.horizontal)
                .foregroundColor(.cyan)
        }
        
        
        ScrollView {
        LazyVGrid(columns: columns,  spacing: 10) {
            ForEach(0..<dice.numberOfDice, id: \.self) { item in
                DiceView(randomRoll: $diceData.rolls[item])
                    .onReceive(timer) { date in
                        randomDice()
                    }
                    
                }
            }
        }
    }
    
    
    func randomDice() {
        for i in 1..<diceData.number {
            diceData.rolls[i] = Int.random(in: 1...diceData.type)
        }
    }
    
    
    func stopTimer() {
            self.timer.upstream.connect().cancel()
        }
        
    func startTimer() {
        timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        }
}

//struct DiceGame_Previews: PreviewProvider {
//    @State static var demo = 10
//    @State static var type = [10, 2]
//    static var previews: some View {
//        DiceGame(dice: DiceViewModel())
//    }
//}

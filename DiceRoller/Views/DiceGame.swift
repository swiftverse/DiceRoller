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
    var body: some View {
        VStack {
            Button("Start Roll") {
                startTimer()               
            }
            .font(.largeTitle)
            
            Button("Stop Roll"){
                dice.randomNumbers = (1...(dice.numberOfDice)).map { _ in Int.random(in: 1...dice.maxNumberonDice)}
                
                let diceData = Dice(type: dice.maxNumberonDice, number: dice.numberOfDice)
                dices.append(diceData)
                
                stopTimer()
                DataManager.save(dices)
                showStopButton.toggle()
            }
            .font(.largeTitle)
           
            
            Text("Total - \(dice.randomNumbers.reduce(0, +))")
                .font(.largeTitle)
                .padding(.horizontal)
                .foregroundColor(.cyan)
        }
        
        
        ScrollView {
        LazyVGrid(columns: columns,  spacing: 10) {
            ForEach(0..<dice.numberOfDice, id: \.self) { item in
                DiceView(randomRoll: $dice.randomNumbers[item])
                    .onReceive(timer) { date in
                        randomDice()
                    }
                    
                }
            }
        }
    }
    
    
    func randomDice() {
        for i in 1..<dice.numberOfDice {
            dice.randomNumbers[i] = Int.random(in: 1...dice.maxNumberonDice)
        }
    }
    
    
    func stopTimer() {
            self.timer.upstream.connect().cancel()
        }
        
    func startTimer() {
        timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        }
}

struct DiceGame_Previews: PreviewProvider {
    @State static var demo = 10
    @State static var type = [10, 2]
    static var previews: some View {
        DiceGame(dice: DiceViewModel())
    }
}

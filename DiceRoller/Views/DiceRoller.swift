//
//  ContentView.swift
//  DiceRoller
//
//  Created by Amit Shrivastava on 04/02/22.
//



import SwiftUI

struct DiceRoller: View {

   // We can use optional if we use .tag(id as Int?)
    //We can use disabled and it remains disabled if we keep it value to false,once true disabled if off
    let numberOfDice = [1, 3, 6, 9, 12, 15, 20, 40, 60, 100]
    let maxNumberOnDice = [1, 3, 6, 9, 12, 15, 20, 40, 60, 100]
    @State private var number: Int?
    @State private var maxNumber: Int?
   @StateObject var diceData = DiceViewModel()
   @State  var type = [Int]()
    @State var isNavigate = false
    
    
    var body: some View {
        NavigationView {
            
           
        Form {
            
            
            
            Section("number of dices") {
                Picker("Dices", selection: $number) {
                    ForEach(numberOfDice, id:\.self) { id in
                        Text("\(id)").tag(id as Int?)
                    }
                }
                .pickerStyle(.segmented)
                
                Section("max number on dice sides") {
                    Picker("Max number", selection: $maxNumber) {
                        ForEach(maxNumberOnDice, id:\.self) { id in
                            Text("\(id)").tag(id as Int?)
                               
                        }
                    }
                    .pickerStyle(.segmented)
                    
            }
                VStack {
            
            Button("Save Settings") {
                    saveData()
                    isNavigate = true
                number = nil
                maxNumber = nil
                }
            .font(.largeTitle)
           
            .disabled(maxNumber == nil || number == nil)
            }

            NavigationLink("Goto Game") {
                    DiceGame(dice: diceData)
                }
            .font(.largeTitle)
            .foregroundColor(.blue)
            .disabled(isNavigate == false)
            .onAppear {
                isNavigate = false
            }
                
                NavigationLink("Old Results") {
                        ShowResults()
                    }
                .font(.largeTitle)
                .foregroundColor(.blue)
                
                
                
                                
                
                   
               
                
           
        }
 
       
    }
        .navigationTitle("Create Dice")
        }
    
    }
    
    func saveData() {
        diceData.numberOfDice = number ?? 6
        diceData.maxNumberonDice = maxNumber ?? 6
        diceData.randomNumbers = (1...(number ?? 6)).map { _ in Int.random(in: 1...(maxNumber ?? 6))}
    }
 
}



struct DiceRoller_Previews: PreviewProvider {
    static var previews: some View {
        DiceRoller()
    }
}


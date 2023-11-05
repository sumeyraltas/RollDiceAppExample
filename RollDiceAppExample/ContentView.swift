//
//  ContentView.swift
//  RollDiceAppExample
//
//  Created by Sumeyra Altas on 5.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var diceCount: Int = 1
    @State private var diceRolls: [Int] = [1]

    var body: some View {
        ZStack {
            
            Color(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 25.0 / 255.0)
                .edgesIgnoringSafeArea(.all)
            
            Spacer()
            
            VStack {
                Spacer()
                HStack {
                    ForEach(0..<min(diceCount, 3), id: \.self) { index in
                        Image("\(diceRolls[index])Dice")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .padding()
                    }
                    
                }
                if diceCount > 3 {
                    HStack {
                        ForEach(3..<diceCount, id: \.self) { index in
                            Image("\(diceRolls[index])Dice")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .padding()
                        }
                    }
                    Spacer()
                }
                
                Spacer()
                
                VStack {
                    Button(diceCount == 1 ? "Roll the Dice" : "Roll the Dices") {
                        diceRolls = (0..<diceCount).map { _ in
                            Int.random(in: 1...6)
                        }
                    }
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    
                    HStack{
                        if diceCount > 1 {
                            Button("-") {
                                diceCount -= 1
                                diceRolls.removeLast()
                            }
                            .font(.title)
                            .frame(width: 64, height: 45)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                        }
                        
                        if diceCount < 6 {
                            Button("+") {
                                diceCount += 1
                                diceRolls.append(1)
                            }
                            .font(.title)
                            .frame(width: 64, height: 45)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Slots
//
//  Created by Sneha Mehra on 10/12/20.
//  Copyright © 2020 Sneha Mehra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["apple", "cherry", "star"]
    private var betAmount = 5
    @State private var credits = 1000
    @State private var number = [0, 0, 0]

    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 50/225, green: 140/225, blue: 120/225))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 100/225, green: 150/225, blue: 200/225))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
                        
            VStack {
                
                Spacer()
                
                //Title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("Slots!!")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    }.scaleEffect(3).padding()
                
                Spacer()
                
                //Credits
                Text("Credits " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white
                    .opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                //Slots Icons
                HStack {
                    Spacer()
                    
                    Image(symbols[number[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(50)
                    
                    Image(symbols[number[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(50)
                    
                    Image(symbols[number[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(50)
                    
                    Spacer()
                }
                
                Spacer()
                
                //Spin Button
                Button(action: {
                    
                    //Change the symbols
                    self.number[0] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.number[1] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.number[2] = Int.random(in: 0...self.symbols.count - 1)
                    
                    // Check winnings
                    
                    if self.number[0] == self.number[1] && self.number[1] == self.number[2] {
                        
                        //Won
                        self.credits += self.betAmount * 10
                    }
                    
                    else {
                        self.credits -= self.betAmount
                    }
                })
                {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 12)
                        .padding([.leading, .trailing], 20)
                        .background(Color.black
                        .opacity(0.5))
                        .cornerRadius(20)
                    
                }
                
                Spacer()
                 
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

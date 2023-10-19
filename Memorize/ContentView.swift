//
//  ContentView.swift
//  Memorize
//
//  Created by Maëlys Callens on 19/10/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🧛🏾‍♀️", "🎃", "👻", "🕷️", "👻"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                // 0..<4 4 dingen in range 0...4 5 dingen in range
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(Color.red)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true //om na te gaan of kaart omgedraaid is ofniet
    
    var body: some View {
        ZStack { //Vstack: up and down, Zstack: erop en erboven
            let base = RoundedRectangle(cornerRadius: 12) //let = constante
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture(perform: {
            isFaceUp.toggle() //functie om false om te zetten naar true en omgekeerd
        })
    }
}

#Preview {
    ContentView()
}


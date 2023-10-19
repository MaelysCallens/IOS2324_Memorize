//
//  ContentView.swift
//  Memorize
//
//  Created by Maëlys Callens on 19/10/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🧛🏾‍♀️", "🎃", "👻", "🕷️", "🐝", "🚘", "🥞", "🍷", "⏰", "🧚‍♀️", "🧟‍♀️", "🧜‍♀️"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                Spacer()
                cardCountAdjusters
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                // 0..<4 4 dingen in range 0...4 5 dingen in range
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.red)
    }
    
    var cardCountAdjusters: some View
    {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button (action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View
    {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View
    {
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true //om na te gaan of kaart omgedraaid is ofniet
    
    var body: some View {
        ZStack { //Vstack: up and down, Zstack: erop en erboven
            let base = RoundedRectangle(cornerRadius: 12) //let = constante
            Group  {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture(perform: {
            isFaceUp.toggle() //functie om false om te zetten naar true en omgekeerd
        })
    }
}

#Preview {
    ContentView()
}


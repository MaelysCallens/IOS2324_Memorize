//
//  ContentView.swift
//  Memorize
//
//  Created by Maëlys Callens on 19/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: false)
            CardView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        .foregroundColor(Color.red)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false //om na te gaan of kaart omgedraaid is ofniet
    
    var body: some View {
        ZStack { //Vstack: up and down, Zstack: erop en erboven
            let base = RoundedRectangle(cornerRadius: 12) //let = constante
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("🎃").font(.largeTitle)
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


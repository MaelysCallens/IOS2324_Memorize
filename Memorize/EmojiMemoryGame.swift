//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Maëlys Callens on 03/11/2023.
//

//VIEWMODEL

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🧛🏾‍♀️", "🎃", "👻", "🕷️", "🐝", "🚘", "🥞", "🍷", "⏰", "🧚‍♀️", "🧟‍♀️", "🧜‍♀️"]
    
    private static func createMemoryGame()-> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 6) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "😅"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var color: Color {
        .red
    }
    
    var score: Int {
        model.score
    }
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
        objectWillChange.send()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}

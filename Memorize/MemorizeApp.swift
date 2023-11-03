//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Maëlys Callens on 19/10/2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

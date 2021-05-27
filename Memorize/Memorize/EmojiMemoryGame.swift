//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by kartikey Garg on 27/05/21.
//

import SwiftUI

class EmojiMemoryGame{
    static var emojis = ["🛵","🚛","🛺","✈️","🚗","🚕","🚙",
                  "🚌","🚎","🏎","🚓","🚑","🚒","🚐",
                  "🛻","🚀","🛸","🚁","🛶","⛵️","🚤",
                  "🛥","🛳","🚢"]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(
            numberOfPairofCards: 4){pairIndex in emojis[pairIndex]}
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
}

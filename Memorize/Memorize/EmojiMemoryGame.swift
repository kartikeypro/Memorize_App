//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by kartikey Garg on 27/05/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    static var emojis = ["🛵","🚛","🛺","✈️","🚗","🚕","🚙",
                  "🚌","🚎","🏎","🚓","🚑","🚒","🚐",
                  "🛻","🚀","🛸","🚁","🛶","⛵️","🚤",
                  "🛥","🛳","🚢"]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(
            numberOfPairofCards: 4){pairIndex in emojis[pairIndex]}
    }
    
 
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // KARTIKEY: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}

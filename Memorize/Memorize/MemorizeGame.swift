//
//  File.swift
//  Memorize
//
//  Created by kartikey Garg on 26/05/21.
//

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card){
        }
    
    init(numberOfPairofCards:Int, createCardContent: (Int)->CardContent) {
        cards=Array<Card>()
        for pairIndex in 0..<numberOfPairofCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
    }
            
    }
    
    struct Card{
        var isFaceUp = false
        var isMatch = false
        var content: CardContent
    }
    
}

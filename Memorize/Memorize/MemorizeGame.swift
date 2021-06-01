//
//  File.swift
//  Memorize
//
//  Created by kartikey Garg on 26/05/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard:Int?
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id==card.id}), !cards[chosenIndex].isMatch,
            !cards[chosenIndex].isFaceUp
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatch=true
                    cards[potentialMatchIndex].isMatch=true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            }
            else{
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        cards[chosenIndex].isFaceUp.toggle()
//        print("\(cards)")
            }
        }
    
    
    init(numberOfPairofCards:Int, createCardContent: (Int)->CardContent) {
        cards=Array<Card>()
        for pairIndex in 0..<numberOfPairofCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id:pairIndex*2))
            cards.append(Card(content: content, id:pairIndex*2+1))
    }
            
    }
    
    struct Card : Identifiable{
        var isFaceUp = false
        var isMatch = false
        var content: CardContent
        var id: Int
        
    }
    
}

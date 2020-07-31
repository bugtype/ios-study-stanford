//
//  MemoryGame.swift
//  Memorize
//
//  Created by Solomon on 6/15/20.
//  Copyright © 2020 TechSolomon. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
       private var indexOfTheOneAndOnlyFaceUpCard: Int? {
         get { cards.indices.filter {cards[$0].isFaceUp}.only }
         set {
             for index in cards.indices {
                 cards[index].isFaceUp = index == newValue
             }
         }
     }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
                  if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                      if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                          cards[chosenIndex].isMatched = true
                          cards[potentialMatchIndex].isMatched = true
                      }
                      cards[chosenIndex].isFaceUp = true
                  } else {
                      indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                  }
              }
    }
    
    mutating func shuffle() {
        cards = self.cards.shuffled()
    }
    
    
    
    func index(of card: Card) -> Int{
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

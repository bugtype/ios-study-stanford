//
//  MemoryGame.swift
//  Memorize
//
//  Created by Solomon on 6/15/20.
//  Copyright © 2020 TechSolomon. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var score: Int!
    var cards: Array<Card>
    var numberOfPairsOfCards: Int!
    var cardContentFactory: (Int) -> CardContent?
    
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
                        score+=1
                      }
                      cards[chosenIndex].isFaceUp = true
                  } else {
                      indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                  }
              }
    }
    
    mutating func shuffle() {
        cards = Array<Card>()
        for pairIndex in 0..<self.numberOfPairsOfCards {
            let content = self.cardContentFactory(pairIndex)!
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards = cards.shuffled()
        self.score = 0
    }
    
    
    
    func index(of card: Card) -> Int{
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: @escaping (Int) -> CardContent) {
        cards = Array<Card>()
        self.score = 0
        self.numberOfPairsOfCards = numberOfPairsOfCards
        self.cardContentFactory = cardContentFactory
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

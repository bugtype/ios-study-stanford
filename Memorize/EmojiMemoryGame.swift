//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Solomon on 6/15/20.
//  Copyright © 2020 TechSolomon. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    @Published private var model: MemoryGame<String>
    
    private(set) var theme = themes.randomElement()!
    
    init() {
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static func createMemoryGame(theme: Theme) -> MemoryGame <String> {
//        let emojis = ["👻", "🎃", "🕷"]
        let emojis = theme.emojis.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: – Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
    
    func shuffle() {
        objectWillChange.send()
        theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    func updatePoint() {
        
    }
}

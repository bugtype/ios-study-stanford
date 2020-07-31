//
//  ContentView.swift
//  Memorize
//
//  Created by Solomon on 6/15/20.
//  Copyright © 2020 TechSolomon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
        Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    // TODO: Refactor after new version of SwiftUI.
                    self.viewModel.choose(card: card)
                }
            }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
            HStack{
                Text(String(viewModel.score))
                .font(.title)
                .padding()
                .foregroundColor(.black)
                .padding(2)                
                Button(action: {
                             self.viewModel.shuffle()
                            }) {
                                Text("Shuffle")
                                .fontWeight(.bold)
                                .font(.title)
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .padding(2)
                                .border(Color.purple, width: 5)
                            }
            }
         
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geomerty in
            ZStack {
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                    Text(self.card.content)
                } else {
                    if !self.card.isMatched {
                        RoundedRectangle(cornerRadius: 10.0).fill()
                    }
                }
            }.font(Font.system(size: min(geomerty.size.width,geomerty.size.height)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}

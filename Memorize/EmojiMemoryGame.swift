//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Hank on 2023/1/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model:MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    // equals to call objectWillChange once the car changes
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🥹","🤩","🤤"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards      //can interpret here to help ui easier see through these
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)  //can modify here
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}

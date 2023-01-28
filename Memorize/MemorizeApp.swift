//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Hank on 2023/1/21.
//

import SwiftUI

let game  = EmojiMemoryGame()

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

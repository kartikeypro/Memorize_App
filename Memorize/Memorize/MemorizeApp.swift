//
//  MemorizeApp.swift
//  Memorize
//
//  Created by kartikey Garg on 17/05/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

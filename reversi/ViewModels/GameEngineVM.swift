//
//  GameEngine.swift
//  reversi
//
//  Created by beyondorigins on 02.02.2026.
//

import Foundation
import Combine
import SwiftUI

class GameEngine: ObservableObject {
    @Published var gameMode: GameMode
    @Published var currentPlayer: StateColor = .white
    init(gameMode_: GameMode) {
        gameMode = gameMode_
    }
}

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
    @Published var gameMode: GameMode = .pvp
    @Published var currentPlayer: StateColor = .white
    @Published var gameOver = false
    @Published var blackScore = 2
    @Published var whiteScore = 2
    @Published var board: [[StateColor]]
    
    private func countWeight(row: Int, column: Int) {
        
    }
    
    public func makeMovePlayer(row: Int, column: Int) {
        
    }
    
    init() {
        board = Array(repeating: Array(repeating: .empty, count: 8), count: 8)
    }
    
}

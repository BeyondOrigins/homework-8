//
//  GameEngine.swift
//  reversi
//
//  Created by beyondorigins on 02.02.2026.
//

class GameEngine {
    var board: Board
    
    func isAvailableMove(move: Position) -> Bool {
        guard let sur = board.getSurrounding(cell: move) else {
            return false
        }
        return true
    }
    
    func getAvailableMoves() -> [Position] {
        
    }
    
    init() {
        
    }
}

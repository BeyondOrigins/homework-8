//
//  GameEngine.swift
//  reversi
//
//  Created by beyondorigins on 02.02.2026.
//

class GameEngine {
    var board: Board
    
    func isAvailableMove(move: Position, player: Player) -> Bool {
        if !board.validPosition(pos: move) {
            return false
        }
        let player_type = player.getCellType()
        guard let sur = board.getSurrounding(cell: move,
            searched_type: player_type.reversed) else {
            return false
        }
        return true
    }
    
    func tryMakeMove(move: Position, player: Player) -> Bool {
        if !isAvailableMove(move: move, player: player) {
            return false
        }
        let player_type = player.getCellType()
        let affected = board.getAffectedCells(move: move, player: player) ?? []
        for affected_cell in affected {
            board.setCellState(cell: affected_cell, state: player_type)
        }
        board.setCellState(cell: move, state: player.getCellType())
        return true
    }
    
    
    
    func checkGameState() -> GameState {
        // check for points
        var (whitePoints, blackPoints): (Int, Int) = board.countPoints()
        if whitePoints == 0 {
            return .blackWon
        }
        else if blackPoints == 0 {
            return .whiteWon
        }
        
    }
    
    init(board: Board, player: Player) {
        self.board = board
    }
}

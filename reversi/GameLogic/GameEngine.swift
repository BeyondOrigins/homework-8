//
//  GameEngine.swift
//  reversi
//
//  Created by beyondorigins on 02.02.2026.
//

class GameEngine {
    static func isAvailableMove(move: Position, player: Player, board: Board) -> Bool {
        if board.getCellState(cell: move) != .empty || !board.validPosition(pos: move) {
            return false
        }
        let player_type = player.getCellType()
        guard let _ = board.getSurrounding(cell: move,
            searched_type: player_type.reversed) else {
            return false
        }
        return true
    }
    
    static func tryMakeMove(move: Position, player: Player, board: Board) -> Bool {
        if !isAvailableMove(move: move, player: player, board: board) {
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
    
    static func checkIfWin(board: Board) -> GameState? { // returns winner if someone won, otherwise returns nil
        // check for points
        let (whitePoints, blackPoints): (Int, Int) = board.countPoints()
        if whitePoints == 0 {
            return .blackWon
        }
        else if blackPoints == 0 {
            return .whiteWon
        }
        guard let _ = board.getAvailableMoves(player: .white),
                let _ = board.getAvailableMoves(player: .black) else {
            if whitePoints == blackPoints {
                return .draw
            }
            return whitePoints > blackPoints ? .whiteWon : .blackWon
        }
        return nil
    }
}

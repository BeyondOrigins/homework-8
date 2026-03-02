//
//  GameEngine.swift
//  reversi
//
//  Created by beyondorigins on 02.02.2026.
//

class GameEngine {
    var board: Board
    var currentPlayer: Player
    
    func isAvailableMove(move: Position, player: Player) -> Bool {
        let player_type = player.getCellType()
        guard let sur = board.getSurrounding(cell: move,
            searched_type: player_type.reversed) else {
            return false
        }
        return true
    }
    
    func makeMove(move: Position, player: Player) {
        
    }
    
    func getAvailableMoves(player: Player) -> [Position]? {
        var moves: [Position] = []
        var player_cell_type: CellState = player.getCellType()
        for x in 0...7 {
            for y in 0...7 {
                let cell = Position(x: x, y: y)
                if board.getCellState(cell: cell) != .empty { continue }
                guard let sur = board.getSurrounding(cell: cell,
                    searched_type: player_cell_type.reversed) else {
                    continue
                }
                moves.append(cell)
            }
        }
        if moves.count == 0 { return nil }
        return moves
    }
    
    init(board: Board, player: Player) {
        self.board = board
        self.currentPlayer = player
    }
}

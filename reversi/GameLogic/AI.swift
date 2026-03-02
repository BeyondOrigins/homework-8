//
//  AI.swift
//  reversi
//
//  Created by beyondorigins on 02.02.2026.
//

class AI {
    static func countWeightedSum(positions: [Position]) -> Double {
        // the last element of the array is the cell which is filled with the move
        var result: Double = 0
        for element in positions.dropLast() {
            result += Board.getSIWeight(cell: element)
        }
        result += Board.getSSWeight(cell: positions[-1])
        return result
    }
    static func evalMove(move: Position, board: Board, player: Player) {
        let cell_state = player.getCellType()
        let affected_cells = board.getAffectedCells(move: move, player: player) ?? []
        var value = countWeightedSum(positions: affected_cells)
        
    }
}

//
//  AI.swift
//  reversi
//
//  Created by beyondorigins on 02.02.2026.
//

class AI {
    static func countWeightedSum(positions: [Position]) -> Double { // count weighted sum based on board's weights
        // the last element of the array is the cell which is filled with the move
        var result: Double = 0
        for element in positions.dropLast() {
            result += Board.getSIWeight(cell: element)
        }
        result += Board.getSSWeight(cell: positions[-1])
        return result
    }
    
    static func evalMove(move: Position, board: Board, player: Player) -> Double { // evaluate the move
        let affected_cells = board.getAffectedCells(move: move, player: player) ?? []
        return countWeightedSum(positions: affected_cells+[move])
    }
    
    static func pickBestMove(player: Player, board: Board) -> Position? { // pick the best move based on counted weights
        guard let moves = board.getAvailableMoves(player: player) else {
            return nil
        }
        let moves_values: [Double] = moves.map{ evalMove(move: $0, board: board, player: player) }
        let index: Int = moves_values.firstIndex(of: moves_values.max()!)!
        return moves[index]
    }
    
    /*
     pick the best move based on counted weights and prediction of the enemy's move
     */
    static func pickBestMoveAdvanced(player: Player, board: Board) -> Position? {
        guard let moves = board.getAvailableMoves(player: player) else {
            return nil
        }
        let moves_values: [Double] = moves.map{ evalMove(move: $0, board: board, player: player) }
        /*
         * TODO: implement calculation of the next enemy's move with respect
         * to the premade player's move
        */
        return nil
    }
}

//
//  Board.swift
//  reversi
//
//  Created by beyondorigins on 02.02.2026.
//

struct Board {
    var board: [[CellState]]
    
    static let ss_weights = [
        [0.8, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.8],
        [0.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4],
        [0.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4],
        [0.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4],
        [0.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4],
        [0.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4],
        [0.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4],
        [0.8, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.8]
    ]
    static let si_weights: [[Double]] = [
        [2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0],
        [2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0],
        [2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0],
        [2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0],
        [2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0],
        [2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0],
        [2.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0],
        [2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0]
    ]
    
    init() {
        board = Array(repeating: Array(repeating: .empty, count: 8), count: 8)
        board[3][3] = .white
        board[4][4] = .white
        board[3][4] = .black
        board[4][3] = .black
    }
    
    mutating func setCellState(cell: Position, state: CellState) {
        self.board[cell.y][cell.x] = state
    }
    
    func getCellState(cell: Position) -> CellState! {
        if !validPosition(pos: cell) { return nil }
        return board[cell.y][cell.x]
    }
    
    func validPosition(pos: Position) -> Bool { // check if position is valid
        if 0 <= pos.x && pos.x <= 7 && 0 <= pos.y && pos.y <= 7 {
            return true
        }
        return false
    }
    
    func getSurrounding(cell: Position, searched_type cell_state: CellState) -> [Position]? { // get surroundning cells of enemy type
        let biases = [
            [-1, -1], [-1, 0], [0, -1],
            [1, 0], [0, 1], [1, 1], [1, -1],
            [-1, 1]
        ]
        var surrounding: [Position] = []
        for bias in biases {
            let close_cell_pos = cell + Position(arr: bias)
            guard let close_cell = getCellState(cell: close_cell_pos) else {
                continue
            }
            if close_cell == cell_state {
                surrounding.append(close_cell_pos)
            }
        }
        if surrounding.count == 0 {
            return nil
        }
        return surrounding
    }
    
    func getAffectedCells(move: Position, player: Player) -> [Position]? { // get cells which will be flipped by this move
        let player_type: CellState = player.getCellType()
        var affected: [Position] = []
        var sur = getSurrounding(cell: move, searched_type: player_type.reversed)!
        var directions: [Position] = []
        for i in 0..<sur.count {
            directions.append(sur[i] - move)
        }
        checkDirectionsLoop: for dir in directions {
            var beam = move
            var cur_affected: [Position] = []
            while (true) {
                beam = beam + dir
                guard let cell = getCellState(cell: beam) else {
                    continue checkDirectionsLoop
                }
                if cell == .empty {
                    continue checkDirectionsLoop
                }
                else if cell == player_type {
                    break
                }
                cur_affected.append(beam)
            }
            affected += cur_affected
        }
        if affected.count == 0 { return nil }
        return affected
    }
    
    func countPoints() -> (Int, Int) { // count current points
        var blackPoints = 0
        var whitePoints = 0
        for tx in 0...7 {
            for ty in 0...7 {
                let cell = getCellState(cell: Position(x: tx, y: ty))
                if cell == .white {
                    whitePoints += 1
                }
                else if cell == .black { blackPoints += 1 }
            }
        }
        return (blackPoints, whitePoints)
    }
    
    mutating func flipCell(position: Position) {
        self.board[position.y][position.x].reverse()
    }
}

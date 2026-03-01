//
//  Enums.swift
//  reversi
//
//  Created by beyondorigins on 02.02.2026.
//

enum Player: Int {
    case black = -1
    case white = 1
}

enum CellState: Int {
    case empty = 0
    case black = -1
    case white = 1
    
    var reversed: CellState {
        return CellState(rawValue: self.rawValue * -1)!
    }
    
    func isPlayersCell(player: Player) -> Bool {
        return player.rawValue == self.rawValue
    }
}

enum GameMode {
    case pvp
    case ai
    case aai
}

struct Position {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    init(arr: Array<Int>) {
        self.x = arr[0]
        self.y = arr[1]
    }
    
    var normalized: Position {
        var new_x = x == 0 ? 0 : x/abs(x)
        var new_y = y == 0 ? 0 : y/abs(y)
        return Position(x: new_x, y: new_y)
    }
}

func +(lhs: Position, rhs: Position) -> Position {
    return Position(x: lhs.x+rhs.x, y: lhs.y+rhs.y)
}

func -(lhs: Position, rhs: Position) -> Position {
    return Position(x: lhs.x+rhs.x, y: lhs.y+rhs.y)
}

func ==(lhs: Position, rhs: Position) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

extension [Position] {
    var normalized: [Position] {
        
        for i in 0..<self.count {
            self[i] = self[i].normalized
        }
    }
}

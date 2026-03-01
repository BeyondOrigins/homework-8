//
//  Enums.swift
//  reversi
//
//  Created by beyondorigins on 02.02.2026.
//

enum CellState: Int {
    case empty = 0
    case black = -1
    case white = 1
    
    var reversed: CellState {
        return CellState(rawValue: self.rawValue * -1)!
    }
}

enum GameMode {
    case pvp
    case ai
    case aai
}

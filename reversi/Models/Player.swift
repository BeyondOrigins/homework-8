//
//  Player.swift
//  reversi
//
//  Created by beyondorigins on 26.01.2026.
//

enum Player: Int {
    case black
    case white

    var opponent: Player {
        self == .black ? .white : .black
    }
}

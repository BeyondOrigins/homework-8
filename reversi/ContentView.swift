//
//  ContentView.swift
//  reversi
//
//  Created by beyondorigins on 26.01.2026.
//

import SwiftUI

struct ContentView: View {
    @State var gameState: GameState = .preGame
    @State var gameMode: GameMode = .pvp
    @State var currentPlayer: Player = .white
    @StateObject var board: Board = Board()
    var body: some View {
        switch gameState {
        case .preGame:
            VStack(spacing: 20) {
                Text("Reversi")
                    .bold()
                    .font(.largeTitle)
                VStack(spacing: 15) {
                    Button (action: {
                        self.gameState = .inGame
                    })
                    {
                        HStack {
                            Text("PvP")
                                .font(.title2)
                            Image(systemName: "person.fill")
                        }
                        
                    }
                    Button (action: {
                        self.gameState = .inGame
                        self.gameMode = .ai
                    })
                    {
                        HStack {
                            Text("Vs AI (noobie)")
                                .font(.title2)
                            Image(systemName: "cpu")
                        }
                        
                    }
                    Button (action: {
                        self.gameState = .inGame
                        self.gameMode = .ai_pro
                    })
                    {
                        HStack {
                            Text("Vs AI (pro)")
                                .font(.title2)
                            Image(systemName: "cpu.fill")
                        }
                        
                    }
                }
                    
            }
        case .inGame:
            VStack {
                Text("White score: 2")
                    .font(.title2)
                Text("Black score: 2")
                    .font(.title2)
                VStack {
                    ForEach(0..<8) { y in
                        HStack {
                            ForEach(0..<8) { x in
                                CellView(color:
                                    board.board[y][x],
                                        row: y, column: x, action:
                                    {
                                        print(board.board[y][x])
                                        if GameEngine.tryMakeMove(move: Position(x: x, y: y), player: currentPlayer, board: board) {
                                            currentPlayer = currentPlayer.reversed
                                        }
                                        print(board.board[y][x])
                                    }
                                )
                            }
                        }
                        .padding(0)
                    }
                }
                .padding(.horizontal, 20)
            }
        default: VStack{}
        }
    }
}

#Preview {
    ContentView()
}

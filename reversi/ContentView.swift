//
//  ContentView.swift
//  reversi
//
//  Created by beyondorigins on 26.01.2026.
//

import SwiftUI

struct ContentView: View {
    @State var gameState: GameState = .preGame
    @State var currentPlayer: Player = .white
    @State var board: Board = Board()
    var body: some View {
        switch gameState {
        case .preGame:
            VStack {
                
            }
        case .inGame:
            <#code#>
        case .draw:
            <#code#>
        case .whiteWon:
            <#code#>
        case .blackWon:
            <#code#>
        case .postGame:
            <#code#>
        }
    }
}

#Preview {
    ContentView()
}

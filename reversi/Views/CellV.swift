//
//  CellView.swift
//  reversi
//
//  Created by beyondorigins on 02.02.2026.
//

import SwiftUI

struct CellView: View {
    @State private var color: CellState
    private var row: Int
    private var column: Int
    private var stoneColor: Color {
            switch color {
            case .black:
                return .black
            case .white:
                return .white
            case .empty:
                return .clear
            }
        }
    var body: some View {
        Button(action: {}) {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .border(Color.black, width: 1)

                    if color != .empty {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(stoneColor)
                            .padding(6)
                            .shadow(radius: 10)
                    }
                }
            }
            .buttonStyle(.plain)
            .aspectRatio(1, contentMode: .fit)
    }

    init(color: CellState, row: Int, column: Int) {
        self.color = color
        self.row = row
        self.column = column
    }

}

#Preview {
    CellView(color: .black, row: 0, column: 0)
}

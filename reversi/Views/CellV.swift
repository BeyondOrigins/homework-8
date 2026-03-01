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

    init(color_: CellState, row_: Int, column_: Int) {
        color = color_
        row = row_
        column = column_
    }

}

#Preview {
    CellView(color_: .black, row_: 0, column_: 0)
}

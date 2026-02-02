//
//  CellVM.swift
//  reversi
//
//  Created by beyondorigins on 02.02.2026.
//

import Foundation
import SwiftUI
import Combine

class CellViewModel: ObservableObject {
    @Published var row: Int = 0
    @Published var column: Int = 0
    
}

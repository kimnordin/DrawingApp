//
//  ToolViewModel.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-16.
//

import Foundation
import SwiftUI

class ToolViewModel: ObservableObject {
    @Published var lines: [Line] = []
    @Published var selectedDrawColor = Color.green
    @Published var selectedCanvasColor = Color.yellow
    @Published var touchEnded = true
    @Published var showColorPicker = false
    @Published var showCanvasColorPicker = false
    @Published var lineWidth: Double = 5.0
}

//
//  DrawView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct MainDrawView: View {
    @State private var lines: [Line] = []
    @State private var selectedColor = Color.green
    @State private var touchEnded = true
    @State private var showColorPicker = false
    @State private var lineWidth: Double = 5.0
    
    let colors: [Color] = [.yellow, .orange, .red, .purple, .blue, .cyan, .green, .mint, .pink]
    
    var body: some View {
        VStack {
            ToolBarView(lines: $lines, selectedColor: $selectedColor, showColorPicker: $showColorPicker)
            CanvasView(lines: $lines, selectedColor: $selectedColor, touchEnded: $touchEnded, lineWidth: $lineWidth)
            if showColorPicker {
                ColorPickerContainerView(selectedColor: $selectedColor, colors: colors)
            }
        }
    }
}

struct MainDrawView_Previews: PreviewProvider {
    static var previews: some View {
        MainDrawView()
    }
}

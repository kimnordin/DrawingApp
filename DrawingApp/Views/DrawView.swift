//
//  DrawView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct DrawView: View {
    @State private var lines: [Line] = []
    @State private var selectedColor = Color.green
    @State private var touchEnded = true
    @State private var showColorPicker = false
    
    let colors: [Color] = [.yellow, .orange, .red, .purple, .blue, .cyan, .green, .mint, .pink]
    
    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 1.0, coordinateSpace: .local)
            .onChanged { value in
                let position = value.location
                if touchEnded {
                    lines.append(Line(points: [position], color: selectedColor))
                    touchEnded = false
                } else if let lastIdx = lines.indices.last {
                    lines[lastIdx].points.append(position)
                }
            }
            .onEnded { _ in
                touchEnded = true
            }
    }
    
    var body: some View {
        VStack {
            ToolBarView(lines: $lines, selectedColor: $selectedColor, showColorPicker: $showColorPicker)
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    
                    context.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                }
            }
            .frame(maxHeight: .infinity)
            .gesture(dragGesture)
            if showColorPicker {
                ColorPickerContainerView(selectedColor: $selectedColor, colors: colors)
            }
        }
    }
}

struct DrawView_Previews: PreviewProvider {
    static var previews: some View {
        DrawView()
    }
}

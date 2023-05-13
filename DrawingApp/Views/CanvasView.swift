//
//  CanvasView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct CanvasView: View {
    @Binding var lines: [Line]
    @Binding var selectedColor: Color
    @Binding var touchEnded: Bool
    @Binding var lineWidth: Double
    
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
        Canvas { context, _ in
            lines.forEach { line in
                var path = Path()
                path.addLines(line.points)
                
                context.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
            }
        }
        .frame(maxHeight: .infinity)
        .gesture(dragGesture)
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(lines: .constant([]), selectedColor: .constant(.red), touchEnded: .constant(false), lineWidth: .constant(12.0))
    }
}

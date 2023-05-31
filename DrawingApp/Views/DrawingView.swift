//
//  CanvasView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct DrawingView: View {
    @ObservedObject var viewModel: ToolViewModel
    
    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 1.0, coordinateSpace: .local)
            .onChanged { value in
                let position = value.location
                if viewModel.touchEnded {
                    viewModel.lines.append(Line(points: [position], color: viewModel.selectedDrawColor))
                    viewModel.touchEnded = false
                } else if let lastIdx = viewModel.lines.indices.last {
                    viewModel.lines[lastIdx].points.append(position)
                }
            }
            .onEnded { _ in
                viewModel.touchEnded = true
            }
    }
    
    var body: some View {
        Canvas { context, _ in
            viewModel.lines.forEach { line in
                var path = Path()
                path.addLines(line.points)
                
                context.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: viewModel.lineWidth, lineCap: .round, lineJoin: .round))
            }
        }
        .frame(maxHeight: .infinity)
        .gesture(dragGesture)
        .background(viewModel.selectedCanvasColor)
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView(viewModel: ToolViewModel())
    }
}

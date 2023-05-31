//
//  CanvasContainerView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-31.
//

import SwiftUI

struct CanvasContainerView: View {
    @State private var isLongPressing = false
    @State private var hoveredColorIndex: Int?
    @ObservedObject var viewModel: ToolViewModel
    let colors: [Color]

    private func dragGesture(_ colorIndex: Int) -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in hoveredColorIndex = colorIndex }
            .onEnded { _ in hoveredColorIndex = nil }
    }
    
    private var longPressGesture: some Gesture {
        LongPressGesture(minimumDuration: 0.3)
            .onChanged { _ in
                isLongPressing = true
            }
            .onEnded { _ in
                isLongPressing = false
                if let index = hoveredColorIndex {
                    viewModel.selectedCanvasColor = colors[index]
                }
                hoveredColorIndex = nil
            }
    }
    
    var body: some View {
        HStack {
            ForEach(0..<colors.count, id: \.self) { colorIndex in
                ColorPickerButtonView(selectedColor: $viewModel.selectedCanvasColor, isHovered: .constant(isLongPressing && hoveredColorIndex == colorIndex), buttonColor: colors[colorIndex])
                    .simultaneousGesture(dragGesture(colorIndex))
            }
        }
        .padding([.leading, .trailing], 8)
        .simultaneousGesture(longPressGesture)
    }
}

struct CanvasContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasContainerView(viewModel: ToolViewModel(), colors: [Color.blue, Color.green, Color.yellow])
    }
}

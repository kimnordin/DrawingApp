//
//  PencilContainerView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct PencilContainerView: View {
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
                    viewModel.selectedDrawColor = colors[index]
                }
                hoveredColorIndex = nil
            }
    }
    
    var body: some View {
        VStack {
            PencilSize(lineWidth: $viewModel.lineWidth)
            HStack {
                ForEach(0..<colors.count, id: \.self) { colorIndex in
                    ColorPickerButtonView(selectedColor: $viewModel.selectedDrawColor, isHovered: .constant(isLongPressing && hoveredColorIndex == colorIndex), buttonColor: colors[colorIndex])
                        .simultaneousGesture(dragGesture(colorIndex))
                }
            }
            .simultaneousGesture(longPressGesture)
        }
        .padding([.leading, .trailing], 8)
    }
}

struct PencilContainerView_Previews: PreviewProvider {
    static var previews: some View {
        PencilContainerView(viewModel: ToolViewModel(), colors: [Color.blue, Color.green, Color.yellow])
    }
}

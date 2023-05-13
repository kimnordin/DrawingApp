//
//  ColorPickerContainerView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct ColorPickerContainerView: View {
    @State private var isLongPressing = false
    @State private var hoveredColorIndex: Int?
    @Binding var selectedColor: Color
    let colors: [Color]

    private func dragGesture(_ colorIndex: Int) -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in hoveredColorIndex = colorIndex }
            .onEnded { _ in hoveredColorIndex = nil }
    }
    
    private var longPressGesture: some Gesture {
        LongPressGesture(minimumDuration: 0.5).onChanged { _ in
            isLongPressing = true
        }
        .onEnded { _ in
            isLongPressing = false
            if let index = hoveredColorIndex {
                selectedColor = colors[index]
            }
            hoveredColorIndex = nil
        }
    }
    
    var body: some View {
        HStack {
            ForEach(0..<colors.count, id: \.self) { colorIndex in
                ColorPickerButtonView(selectedColor: $selectedColor, isHovered: .constant(isLongPressing && hoveredColorIndex == colorIndex), buttonColor: colors[colorIndex])
                    .simultaneousGesture(dragGesture(colorIndex))
            }
        }
        .simultaneousGesture(longPressGesture)
    }
}

struct ColorPickerContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerContainerView(selectedColor: .constant(.red), colors: [Color.blue, Color.green, Color.yellow])
    }
}

//
//  ColorPickerView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//


import SwiftUI

struct ColorPickerButtonView: View {
    @Binding var selectedColor: Color
    @Binding var isHovered: Bool
    let buttonColor: Color
    
    private var tapGesture: some Gesture {
        TapGesture()
            .onEnded { _ in
                selectedColor = buttonColor
            }
    }
    
    var body: some View {
        VStack {
            Circle()
                .fill(buttonColor)
                .scaleEffect(isHovered ? 1.2 : 1.0)
                .animation(.easeInOut, value: isHovered)
                .simultaneousGesture(tapGesture)
        }
    }
}

struct ColorPickerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerButtonView(selectedColor: .constant(.green), isHovered: .constant(true), buttonColor: .red)
    }
}

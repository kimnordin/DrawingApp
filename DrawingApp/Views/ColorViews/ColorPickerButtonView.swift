//
//  ColorPickerView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//


import SwiftUI

struct ColorButtonStyle: ButtonStyle {
    let buttonColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(buttonColor)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ColorPickerButtonView: View {
    @Binding var selectedColor: Color
    @Binding var isHovered: Bool
    let buttonColor: Color
    
    var body: some View {
        VStack {
            Circle()
                .fill(buttonColor)
                .scaleEffect(isHovered ? 1.2 : 1.0)
                .animation(.easeInOut, value: isHovered)
                .simultaneousGesture(TapGesture()
                    .onEnded { _ in
                        print("tap gesture")
                        selectedColor = buttonColor
                    }
                )
        }
    }
}

/*
     Button("") {
         selectedColor = .red
     }
     .buttonStyle(ColorButtonStyle(buttonColor: buttonColor))
     .frame(width: 50, height: 50)
 */

struct ColorPickerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerButtonView(selectedColor: .constant(.green), isHovered: .constant(true), buttonColor: .red)
    }
}

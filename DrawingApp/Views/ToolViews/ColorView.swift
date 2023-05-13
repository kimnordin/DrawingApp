//
//  ColorView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct ColorView: View {
    @Binding var selectedColor: Color
    @Binding var showColorPicker: Bool
    
    var body: some View {
        Button {
            showColorPicker.toggle()
        } label: {
            Circle()
                .asToolView(selectedColor: selectedColor)
        }
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(selectedColor: .constant(.red), showColorPicker: .constant(false))
    }
}

//
//  PencilSize.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-31.
//

import SwiftUI

struct PencilSize: View {
    @State private var isEditing = false
    @Binding var lineWidth: Double
    
    var body: some View {
        VStack {
            Slider(
                value: $lineWidth,
                in: 0...100,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            Text("\(lineWidth)")
                .foregroundColor(isEditing ? .red : .blue)
        }
    }
}

struct PencilSize_Previews: PreviewProvider {
    static var previews: some View {
        PencilSize(lineWidth: .constant(50))
    }
}

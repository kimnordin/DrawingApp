//
//  ToolBarView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct ToolBarView: View {
    @Binding var lines: [Line]
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                UndoView(lines: $lines)
                ClearView(lines: $lines)
            }
            .padding(5)
            .background(Color.blue)
            .cornerRadius(geometry.size.height)
            .frame(maxWidth: .infinity)
            .clipped()
        }
        .frame(height: ViewConstants.toolButtonSize.height)
        .padding(.bottom, 8)
    }
}

struct ToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarView(lines: .constant([]))
    }
}

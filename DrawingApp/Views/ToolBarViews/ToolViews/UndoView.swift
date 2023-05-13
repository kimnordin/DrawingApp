//
//  UndoView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct UndoView: View {
    @Binding var lines: [Line]
    
    var body: some View {
        Button {
            if !lines.isEmpty {
                lines.removeLast()
            }
        } label: {
            Image(systemName: "arrow.uturn.left.circle.fill")
                .asToolView()
        }
    }
}

struct UndoView_Previews: PreviewProvider {
    static var previews: some View {
        UndoView(lines: .constant([]))
    }
}

//
//  ClearView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct ClearView: View {
    @State private var confirmDeletion = false
    @Binding var lines: [Line]
    let geometry: GeometryProxy
    private let padding = 1.0
    
    var body: some View {
        if confirmDeletion {
            HStack {
                let toolButtonWidth = ViewConstants.toolButtonSize.width - (padding * 2)
                let toolButtonHeight = ViewConstants.toolButtonSize.height - (padding * 2)
                Button {
                    lines.removeAll()
                    withAnimation {
                        confirmDeletion = false
                    }
                } label: {
                    Image(systemName: "checkmark.circle")
                        .asToolView(color: .blue, size: CGSize(width: toolButtonWidth, height: toolButtonHeight))
                }
                Button {
                    withAnimation {
                        confirmDeletion = false
                    }
                } label: {
                    Image(systemName: "x.circle")
                        .asToolView(color: .blue, size: CGSize(width: toolButtonWidth, height: toolButtonHeight))
                }
            }
            .padding(2)
            .background(Color.white)
            .cornerRadius(geometry.size.height)
            .clipped()
        } else {
            Button {
                withAnimation {
                    confirmDeletion = true
                }
            } label: {
                Image(systemName: "trash.circle.fill")
                    .asToolView()
            }
        }
    }
}

struct ClearView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            ClearView(lines: .constant([]), geometry: geometry)
        }
    }
}

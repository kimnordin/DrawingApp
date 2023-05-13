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
    
    var body: some View {
        if confirmDeletion {
            HStack {
                Button {
                    lines.removeAll()
                    withAnimation {
                        confirmDeletion = false
                    }
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .asToolView()
                }
                Button {
                    withAnimation {
                        confirmDeletion = false
                    }
                } label: {
                    Image(systemName: "x.circle.fill")
                        .asToolView()
                }
            }
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
        ClearView(lines: .constant([]))
    }
}

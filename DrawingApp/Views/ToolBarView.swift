//
//  ToolBarView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct ToolBarView: View {
    @ObservedObject var viewModel: ToolViewModel
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ColorView(selectedColor: $viewModel.selectedCanvasColor, showColorPicker: $viewModel.showCanvasColorPicker)
                ColorView(selectedColor: $viewModel.selectedDrawColor, showColorPicker: $viewModel.showPencilEditor)
                UndoView(lines: $viewModel.lines)
                ClearView(lines: $viewModel.lines, geometry: geometry)
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
        ToolBarView(viewModel: ToolViewModel())
    }
}

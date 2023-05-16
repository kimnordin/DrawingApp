//
//  MainDrawView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct MainDrawView: View {
    @StateObject private var viewModel = ToolViewModel()
    let colors: [Color] = [.yellow, .orange, .red, .purple, .blue, .cyan, .green, .mint, .pink]
    
    var body: some View {
        VStack {
            ToolBarView(viewModel: viewModel)
            CanvasView(viewModel: viewModel)
            if viewModel.showColorPicker {
                ColorPickerContainerView(selectedColor: $viewModel.selectedDrawColor, colors: colors)
            }
            if viewModel.showCanvasColorPicker {
                ColorPickerContainerView(selectedColor: $viewModel.selectedCanvasColor, colors: colors)
            }
        }
        .background(viewModel.selectedCanvasColor)
    }
}

struct MainDrawView_Previews: PreviewProvider {
    static var previews: some View {
        MainDrawView()
    }
}

//
//  MainDrawView.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import SwiftUI

struct MainDrawView: View {
    @StateObject private var viewModel = ToolViewModel()
    let colors: [Color] = [.white, .black, .yellow, .orange, .red, .purple, .blue, .cyan, .green, .mint, .pink]
    
    var body: some View {
        VStack {
            ToolBarView(viewModel: viewModel)
            DrawingView(viewModel: viewModel)
            if viewModel.showPencilEditor {
                PencilContainerView(viewModel: viewModel, colors: colors)
            }
            if viewModel.showCanvasColorPicker {
                CanvasContainerView(viewModel: viewModel, colors: colors)
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

//
//  ViewModifiers.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import Foundation
import SwiftUI

// SwiftUI
extension Image {
    func asToolView(color: Color = Color.white, size: CGSize = ViewConstants.toolButtonSize) -> some View {
        resizable()
        .foregroundColor(color)
        .frame(width: size.width, height: size.height)
    }
}

extension Circle {
    func asToolView(selectedColor: Color) -> some View {
        strokeBorder(Color.white, lineWidth: 3)
        .background(Circle().fill(selectedColor))
        .frame(width: ViewConstants.toolButtonSize.width, height: ViewConstants.toolButtonSize.height)
    }
}

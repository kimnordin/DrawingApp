//
//  ViewModifiers.swift
//  DrawingApp
//
//  Created by Kim Nordin on 2023-05-13.
//

import Foundation
import SwiftUI

extension Image {
    func asToolView(color: Color = Color.white) -> some View {
        resizable()
        .foregroundColor(color)
        .frame(width: ViewConstants.toolButtonSize.width, height: ViewConstants.toolButtonSize.height)
    }
}

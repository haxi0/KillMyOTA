//
//  ButtonStyles.swift
//  KillMyOTA
//
//  Created by Анохин Юрий on 27.01.2023.
//

import SwiftUI

public struct CustomButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.body.weight(.medium))
            .padding(.vertical, 12)
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12.0, style: .continuous)
                    .fill(Color.accentColor)
                )
            .opacity(configuration.isPressed ? 0.4 : 1.0)
    }
}

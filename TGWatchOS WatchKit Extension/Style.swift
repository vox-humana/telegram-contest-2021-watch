//
//  Style.swift
//  TGWatchOS WatchKit Extension
//
//  Created by Arthur Semenyutin on 7/3/21.
//

import SwiftUI

struct AccentStyle: ButtonStyle {
    private let color = Color.accentColor // doesn't work on watchOS 6
    
    func makeBody(configuration: ButtonStyleConfiguration) -> some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(Color.accentColor)
            .overlay(
                configuration.label
                    .font(.tgTitle)
                    .foregroundColor(.white)
            )
            .frame(height:44)
    }
}

struct AccentStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("New Message") {
            
        }
        .buttonStyle(AccentStyle())
    }
}

extension Font {
    static let tgTitle = Font.system(size: 17)
    static let tgChatTitle = tgTitle.weight(.medium)
}

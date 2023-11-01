//
//  AvatarView.swift
//  JsonPlaceholderApp
//
//  Created by marco.gutierrez on 31/10/23.
//

import SwiftUI

/// View to display a circle with a text.
struct AvatarView: View {
    /// Text to show in the avatar circle.
    var text: String

    var body: some View {
        Circle()
            .fill(Color.clear)
            .strokeBorder(Color.primary)
            .frame(width: 40, height: 40, alignment: .center)
            .overlay {
                Text(text)
                    .foregroundStyle(.primary)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
    }
}

#Preview {
    AvatarView(text: "1")
}

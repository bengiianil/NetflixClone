//
//  RoundedTextView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 26.02.2024.
//

import SwiftUI

struct RoundedTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 8)
            .padding(8)
            .foregroundStyle(.white)
            .font(.footnote)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 2.0)
            }
    }
}

#Preview {
    RoundedTextView(text: "RoundedTextView")
}

//
//  LinearGradientView.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 26.02.2024.
//

import SwiftUI

struct LinearGradientView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
            }
            .padding()
            .padding(.bottom, 30)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.black, Color.clear]),
                    startPoint: .bottom,
                    endPoint: .top
                )
                .frame(width: UIScreen.main.bounds.width)
            )
        }    }
}

#Preview {
    LinearGradientView()
}

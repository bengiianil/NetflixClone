//
//  CustomBackButton.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 27.02.2024.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.red)
                .imageScale(.large)
                .font(.largeTitle)
        }
    }
}
#Preview {
    CustomBackButton()
}

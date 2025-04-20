//
//  Animation.swift
//  StudyMaterial
//
//  Created by Jeevith on 27/01/25.
//

import SwiftUI

struct Animation: View {
    @State private var isAnimating = false
    @State private var index = 0
    let img = ["heart.fill", "star.fill", "bell.fill", "heart.fill", "trash.fill", "folder.fill", "magnifyingglass", "plus", "minus", "checkmark", "xmark", "gearshape.fill", "flame.fill", "moon.fill", "sun.max.fill", "cloud.fill", "bolt.fill", "envelope.fill", "paperplane.fill", "leaf.fill"]

    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .fill(Color.white)
                .frame(width: 200, height: 200)
                .shadow(color: Color.blue, radius: 10)
                .overlay(
                    Image(systemName: img[index])
                        .foregroundColor(.red)
                        .font(.largeTitle)
                )
                .opacity(isAnimating ? 0 : 1)
                .animation(.easeInOut(duration: 0.5), value: isAnimating)

            Button(action: {
                isAnimating.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isAnimating.toggle()
                    index = (index == img.count - 1) ? 0 : (index + 1)
                }
            }) {
                Text("Animate")
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 120, height: 50)
                    .font(.title3)
                    .bold()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    Animation()
}

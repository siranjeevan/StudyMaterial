//
//  Text Animation.swift
//  SWIFT LEARNING
//
//  Created by Jeevith  on 25/01/25.
//

import SwiftUI

struct AnimatingText: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Hello, SwiftUI!")
                .opacity(isAnimating ? 0 : 1)
                .animation(.easeInOut(duration: 10), value: isAnimating)
            Text("Hello, SwiftUI!")
                .foregroundStyle(isAnimating ? .red : .purple)
                .animation(.easeInOut(duration: 1), value: isAnimating)
            Text("Hello, SwiftUI!")
                .offset(y: isAnimating ? -200 : 0)
                .animation(.easeInOut(duration: 1), value: isAnimating)
//            Text("Hello, SwiftUI!")
//                .font(isAnimating ? .largeTitle : .body)
//                .animation(.easeInOut(duration: 1), value: isAnimating)
            
            Spacer()
            
            Button("Animate") {
                isAnimating.toggle()
            }
            .buttonStyle(.borderedProminent) 
        }
        .font(.largeTitle.weight(.heavy).width(.condensed))
    }
}

#Preview {
    AnimatingText()
}

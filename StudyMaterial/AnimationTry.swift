//
//  AnimationTry.swift
//  StudyMaterial
//
//  Created by Jeevith on 27/01/25.
//

import SwiftUI

struct AnimationTry: View {
    let SunColor = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.75, blue: 0, alpha: 1)),  // Sun-like gold
                                                              Color(#colorLiteral(red: 1, green: 0.9, blue: 0.2, alpha: 1)),  // Bright yellow
                                                              Color(#colorLiteral(red: 1, green: 0.6, blue: 0, alpha: 1))]), // Warm orange
                                   startPoint: .topTrailing,
                                   endPoint: .bottomLeading)
    let dayBackground = LinearGradient(colors: [.blue.opacity(0.7), .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    @State private var carOffset: CGFloat = 300
    
    func day() -> some View {
        ZStack {
            dayBackground
                .edgesIgnoringSafeArea(.all)
            
            Image("road")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .fill(SunColor)
                .shadow(color: .yellow, radius: 10)
                .frame(width: 100, height: 100)
                .offset(x: 0, y: -340)
            
            Image("car")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 50)
                .offset(x: 50 , y: carOffset)
                .animation(.easeInOut(duration: 3).repeatForever(autoreverses: false), value: carOffset)
        }
        .onAppear {
            carOffset = -10
        }
    }
    
    var body: some View {
        day()
    }
}

#Preview {
    AnimationTry()
}

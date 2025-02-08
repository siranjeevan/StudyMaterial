//
//  XOtab1.swift
//  StudyMaterial
//
//  Created by Jeevith  on 04/02/25.
//

import SwiftUI

struct XOtab1: View {
    var background = LinearGradient(
        gradient: Gradient(colors: [Color.blue.opacity(0.10), Color.cyan]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        VStack
        {
            NavigationView {
                background
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            Text("Tic Tac Toe")
                                .font(.system(size: 70))
                                .padding()
                                .bold()
                                .foregroundColor(.cyan)

                                NavigationLink(destination: XOtab2()) {
                                Text("Start Game")
                                        .font(.title3)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(background)
                                    .cornerRadius(10)
                        }
                    }
                )
            }
        }
    }
}

#Preview {
    XOtab1()
}

//
//  HomePageQuiz.swift
//  StudyMaterial
//
//  Created by Jeevith  on 28/02/25.
//

import SwiftUI

struct HomePageQuiz: View {
    var body: some View {
        
        ZStack {
            LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 233/255, green: 241/255, blue: 250/255), // Light Blue (#E9F1FA)
                            Color(red: 0/255, green: 171/255, blue: 228/255),   // Bright Blue (#00ABE4)
                            Color.white                                         // White (#FFFFFF)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    HomePageQuiz()
}

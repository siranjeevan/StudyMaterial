//
//  Question.swift
//  StudyMaterial
//
//  Created by Jeevith  on 30/01/25.
//

import SwiftUI

struct Question: View {
    func style() -> some View {
        Button {
            
        } label: {
            Text("Text")
                .frame(width: 380, height: 70)
                .background(Color.white)
                .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.top , 5)
        }

    }
    var body: some View {
        Text("Question")
            .font(.title)
            .offset(x: 0, y: -370)
            .padding()
            .foregroundStyle(.blue)
        
        .overlay(
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 380, height: 150)
            .shadow(radius: 10)
            .foregroundColor(.white)
            .offset(x: 0, y: -250)
        )
        .overlay(
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 1), spacing: 10)
            {
                ForEach(0..<4) { _ in
                    style()
                }
            }
        )
        .overlay(
            Button(action: {
                
            }, label: {
                Text("Check")
                    .frame(width: 100, height: 40)
                .background(Color.white)
                
                .cornerRadius(20)
            .shadow(radius: 10)
            }
        )
            .offset(x: 0, y: 350)
            )
        
        
        
        
    }
}

#Preview {
    Question()
}

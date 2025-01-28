//
//  BUTTON.swift
//  SWIFT LEARNING
//
//  Created by Jeevith  on 24/01/25.
//

import SwiftUI

struct Butto: View {
    @State var name : String = "No Press"
    var body: some View {
        Text(name)
            .bold()
        
        Button(action: {
            self.name = "Data Was Save Data"
        }, label: {
            Text("Save")
                .foregroundColor(Color.white)
                .font(.subheadline)
                .padding()
                .padding(.horizontal , 20)
                .background(
                    Color.red
                        .cornerRadius(10)
                        .shadow(radius: 10)
                )
        }
        )
        .padding()
        
        Button(action: {
            self.name = "Heart"
        }, label:{
            Circle()
                .fill(Color.white)
                .frame(width: 88.0 , height: 88.0)
                .shadow(color: Color.red ,radius: 10)
                .overlay {
                    Image(systemName: "heart.fill")
                        
                        .foregroundColor(Color(hue: 1.0, saturation: 0.903, brightness: 0.934))
                }
        }
        )
    }
}

#Preview {
    Butto()
}

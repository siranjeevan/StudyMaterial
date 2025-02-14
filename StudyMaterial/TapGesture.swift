//
//  TapGesture.swift
//  StudyMaterial
//
//  Created by Jeevith  on 13/02/25.
//

import SwiftUI

struct TapGesture: View {
    @State private var isTapped: Bool = false
    var body: some View {
        VStack
        {
            RoundedRectangle(cornerRadius: 20)
                .fill(isTapped ? Color.red : Color.black)
                .frame(width: 300, height: 150)
                
         
            Text("Tap the rectangle")
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(20)
                .onTapGesture(count: 5, perform:  {
                    isTapped.toggle()
                })
        }
    }
}

#Preview {
    TapGesture()
}

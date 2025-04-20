//
//  DraggableCircle.swift
//  StudyMaterial
//
//  Created by Jeevith on 13/02/25.
//

import SwiftUI

struct DraggableCircle: View {
    @State private var offset: CGSize = .zero
    
    var body: some View {
        Circle()
            .fill(Color.yellow)
            .frame(width: 150, height: 150)
            .edgesIgnoringSafeArea(.all)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation(.bouncy()) {
                            offset = value.translation
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.bouncy()) {
                            offset = .zero
                        }
                    }
            )
    }
}

#Preview {
    DraggableCircle()
}

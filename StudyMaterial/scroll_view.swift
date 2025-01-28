//
//  scroll_view.swift
//  SWIFT LEARNING
//
//  Created by Jeevith  on 23/01/25.
//

import SwiftUI

struct scroll_view: View {
    let emojiArray = [
        "😀", "😃", "😄", "😁", "😆", "😂", "🤣",
        "🥰", "😍", "😘", "🤩",
        "🐶", "🐱", "🐭", "🐻",
        "🍎", "🍊", "🍉", "🍕",
        "🏠", "🏡", "✈️", "🚗"
    ]
    var body: some View {
        Text("EMOJIS")
            .font(.title)
            .fontWeight(.black)
        ScrollView
        {
            VStack
            {
                ForEach(emojiArray , id: \.self){emojiArray in
                    Text(emojiArray)
                        .font(.largeTitle)
                        .frame(width: 100 , height: 100)
                        .background(.yellow)
                    
                }
            }
        }
    }
}

#Preview {
    scroll_view()
}

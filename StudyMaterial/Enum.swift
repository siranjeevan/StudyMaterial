//
//  Enum.swift
//  StudyMaterial
//
//  Created by Jeevith  on 07/02/25.
//

import SwiftUI

enum Fruits: CaseIterable {
    case Apple
    case Orange
    case Banana
    case Pineapple
    
    var Color : Color {
        switch self {
        case .Apple:
            return .red
        case .Orange:
            return .orange
        case .Banana:
            return .yellow
        case .Pineapple:
            return .green
        }
    }
    var ImageName : String {
        switch self {
        case .Apple:
            return "apple"
        case .Orange:
            return "orange"
        case .Banana:
            return "banana"
        case .Pineapple:
            return "pineapple"
        }
    }
}

struct EnumView: View {
    var body: some View {
        Text("Fruits")
            .font(.largeTitle)
            .bold()
        ScrollView
        {
            VStack {
                ForEach(Fruits.allCases, id: \.self) { fruit in
                    Image(fruit.ImageName)
                        .frame(width: 200, height: 200)
                        .background(fruit.Color)
                }
            }
        }
        .frame(width : 300, height : 400)
    }
}

#Preview {
    EnumView()
}

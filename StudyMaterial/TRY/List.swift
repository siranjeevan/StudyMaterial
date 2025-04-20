//
//  List.swift
//  StudyMaterial
//
//  Created by Jeevith  on 06/02/25.
//

import SwiftUI

struct List: View {
    @State var List_values: [String] = ["apple" , "banana" , "orange" , "mango"]
    @State var text: String = ""
    var body: some View {
        
        VStack {
            
            VStack {
                Text("List values")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth : .infinity , maxHeight : .infinity)
                    .offset(y: -250)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 300, height: 400)
                        ScrollView
                        {
                            VStack {
                                ForEach(List_values, id: \.self) { value in
                                    Text(value)
                                        .font(.title)
                                        .frame(width: 300, height: 50)
                                }
                            }
                        }
                        .frame(width: 300, height: 400)
                    }
                VStack {
                    TextField("Add value", text: $text)
                        .font(.title2)
                        .padding()
                    Button(action: {
                        List_values.append(text)
                    }) {
                        Text("Add")
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.cyan)
        
    }
}

#Preview {
    List()
}

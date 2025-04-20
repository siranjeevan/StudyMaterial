//
//  Option select.swift
//  StudyMaterial
//
//  Created by IOSTEAM   on 4/21/25.
//

import SwiftUI

struct Option_select: View {
    @State private var text = ""
        @State private var showOptions = false
    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]

        var body: some View {
            VStack(alignment: .leading) {
                TextField("Select an option", text: $text)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .onTapGesture {
                        withAnimation {
                            showOptions.toggle()
                        }
                    }

                if showOptions {
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(options.filter { $0.lowercased().contains(text.lowercased()) || text.isEmpty }, id: \.self) { option in
                            Text(option)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .onTapGesture {
                                    text = option
                                    showOptions = false
                                }
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 3)
                }

                Spacer()
            }
            .padding()
        }
}

#Preview {
    Option_select()
}

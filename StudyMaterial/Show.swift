//
//  Show.swift
//  StudyMaterial
//
//  Created by Jeevith  on 05/02/25.
//

import SwiftUI

struct Show: View {
    @State var isBulbOn: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                Image(systemName:isBulbOn ? "lightbulb.fill":"lightbulb")
                    .resizable()
                    .frame(width:100,height:100)
                    .foregroundColor(isBulbOn ? .yellow : .black)
                Button(action: {
                    self.isBulbOn.toggle()
                }) {
                    Text("Toggle")
                }
                DayOrNight(isBulbOn: $isBulbOn)
               
                NavigationLink("Day or Night", destination: DayOrNight(isBulbOn: $isBulbOn))
            }
        }
    }
}

struct DayOrNight: View {
    @Binding var isBulbOn: Bool
    var body: some View {
        Image(systemName:isBulbOn ? "moonphase.full.moon":"sun.max.fill")
            .resizable()
            .frame(width:100,height:100)
            .foregroundColor(isBulbOn ? .gray : .black)
        Button(action: {
            self.isBulbOn.toggle()
        }) {
            Text("Toggle")
        }
    }
}

#Preview {
    Show()
}

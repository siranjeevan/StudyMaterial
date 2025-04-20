//
//  sunmoon.swift
//  StudyMaterial
//
//  Created by Jeevith  on 27/01/25.
//

import SwiftUI

struct sunmoon: View {
    let sunGradient = LinearGradient(colors: [.red,.yellow,.orange], startPoint: .topLeading, endPoint: .bottomTrailing)
    let moonGradient = LinearGradient(colors: [.clear,.clear,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
    let dayBackground = LinearGradient(colors: [.sky,.sky,.white], startPoint: .topLeading, endPoint: .bottomTrailing)
    let nightBackground = LinearGradient(colors: [.black], startPoint: .topLeading, endPoint: .bottomTrailing)
    @State private var isCloudsMove = false
    @State private var isDay = false
    
    var body: some View {
        ZStack{
            isDay ? dayBackground.edgesIgnoringSafeArea(.all):nightBackground.edgesIgnoringSafeArea(.all)//declare sk
            if !isDay{
                ForEach(0..<100,id:\.self){_ in
                    Circle()
                        .fill(.white)
                        .frame(width: CGFloat.random(in: 2...3), height: CGFloat.random(in: 2...3))
                        .position(x:CGFloat.random(in: 0...500),y:CGFloat.random(in: 0...1000))
                }
            }
            Circle().fill(sunGradient).frame(width: 100, height: 100)
                .shadow(color:.red,radius: 10)
                .offset(y:isDay ? -300 : 400)
            
            
            Circle().fill(moonGradient).frame(width: 100, height: 100)
                .shadow(color:.red,radius: 10)
                .offset(y:isDay ? 400 : -300)
            
            Image("Clouds")
                .resizable()
                .frame(width: 500,height: 200)
                .offset(x:isCloudsMove ? 500 : -500,y:-300)
                .animation(.easeInOut(duration: 10).repeatForever(autoreverses: false), value: isCloudsMove)
                .onAppear{
                    isCloudsMove.toggle()
                    
                }
            
            Image("Sceneary")
                .resizable()
                .frame(width: 500,height: 400)
                .offset(y:300)
        }
        .animation(.easeInOut(duration: 10).repeatForever(autoreverses: false), value: isDay)
    }
}

#Preview {
    sunmoon()
}

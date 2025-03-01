//
//  Score.swift
//  StudyMaterial
//
//  Created by Jeevith  on 01/03/25.
//

import SwiftUI

struct Score: View {
    @ObservedObject var game : BackendViewModel = BackendViewModel()
    @State var NextPage : Bool = false
    var score: Int
    var body: some View {
        ZStack {
            Text("Congratulations!")
                .font(.system(size: 43, weight: .bold))
                .offset(y: -250)
            Image("QUIZ1")
                .resizable()
                .frame(width: 400, height: 400)
                .offset(x : -10)
            
            Text("Your Score")
                .font(.system(size: 30, weight: .black))
                .offset(x : 20 , y: -80)
            Text("\(score) / \(game.Question.count)")
                .font(.system(size: 40, weight: .bold))
                .offset(x : 10 , y: -30)
                .shadow(color : .yellow, radius: 3)
            
            Button {
                NextPage = true
            } label: {
                Image("restart")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                    .background(.white)
                    .cornerRadius(10)
            }
            .offset(x : 100 , y: 200)
            
            Button {
                
                }
                label: {
                Image("back")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                    .background(.white)
                    .cornerRadius(10)
            }
            .offset(x : 0 , y: 200)

            Button {
                
            } label: {
                Image("QUIZ4")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                    .background(.white)
                    .cornerRadius(10)
            }
            .offset(x : -100 , y: 200)
            .fullScreenCover(isPresented: $NextPage) {
                QuestionTab()
            }
        
        }
        .frame(maxWidth : .infinity , maxHeight: .infinity)
        .background(.yellow)
    }
}

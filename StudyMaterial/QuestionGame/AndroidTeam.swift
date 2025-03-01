//
//  AndroidTeam.swift
//  StudyMaterial
//
//  Created by Jeevith  on 17/02/25.
//

import Foundation
import SwiftUI

class backendViewModel: ObservableObject {
    @Published private(set) var Question: [String] = []
    @Published private(set) var Answer: [String] = []
    @Published private(set) var Option: [[String]] = []
    @Published var questionNumber: Int = 0
    @Published var selectedAnswer: String?
    @Published var isAnswered = false
    @Published var score: Int = 0
    @Published var isCheck = false
    @Published var selectOption: [String] = []
    @Published var IndexSelected: Int = 0
    @Published var nextTab : Int = 0

    init() {
        // Default Questions
        Question = [
            "What does CPU stand for?",
            "Which of the following is a programming language?",
            "What is the main function of an operating system?",
            "What does HTTP stand for?",
            "Which data structure uses LIFO (Last In, First Out) principle?"
        ]
        Answer = [
            "A) Central Processing Unit",
            "B) Python",
            "A) To manage hardware and software resources",
            "A) Hyper Text Transfer Protocol",
            "B) Stack"
        ]
        Option = [
            ["A) Central Processing Unit", "B) Computer Processing Unit", "C) Central Program Unit", "D) Central Power Unit"],
            ["A) HTML", "B) Python", "C) HTTP", "D) CSS"],
            ["A) To manage hardware and software resources", "B) To create websites", "C) To perform arithmetic calculations", "D) To design graphics"],
            ["A) Hyper Text Transfer Protocol", "B) High Technology Transmission Protocol", "C) Hyperlink Transfer Process", "D) Hyper Transfer Text Program"],
            ["A) Queue", "B) Stack", "C) Linked List", "D) Array"]
        ]
        
        selectOption = Array(repeating: "", count: Question.count)
    }

    func correctAnswer() {
        if selectedAnswer == Answer[questionNumber] {
            score += 1
        }
        isAnswered = true
        selectOption[questionNumber] = selectedAnswer ?? ""
    }

    func getButtonColor(for option: String) -> Color {
        if isAnswered {
            if option == Answer[questionNumber] {
                return .green
            } else if option == selectedAnswer {
                return .red
            }
        }
        return .black
    }
}

struct Test: View {
    @ObservedObject var game = backendViewModel()
    @State private var navigateToGame = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.pink, Color.white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("Quiz📝")
                        .font(.system(size: 50, weight: .black))
                        .foregroundColor(.white)
                        .offset(x: 0, y: -50)
                    
                    Text("\(game.questionNumber + 1).\(game.Question[game.questionNumber])")
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 350, height: 150)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.white]),
                                                   startPoint: .bottom,
                                                   endPoint: .top))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .offset(x: 0, y: -30)
                    
                    VStack(spacing: 20) {
                        ForEach(game.Option[game.questionNumber], id: \.self) { option in
                            Button(action: {
                                if !game.isAnswered {
                                    game.selectedAnswer = option
                                    game.isCheck = true
                                }
                            }) {
                                Text(option)
                                    .bold()
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.white]),
                                                               startPoint: .topTrailing,
                                                               endPoint: .bottomLeading))
                                    .foregroundColor(game.getButtonColor(for: option))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(radius: 3)
                            }
                            .disabled(game.isAnswered)
                        }
                    }
                    .frame(width: 350)
                    .offset(x: 0, y: -30)
                    
                    Button {
                        game.correctAnswer()
//                        print(game.score)
                        game.nextTab += 1
                        if game.nextTab == 5 {
                            navigateToGame = true
                        }
                        
                    } label: {
                        Text("Check")
                            .font(.system(size: 20, weight: .black))
                            .foregroundStyle(.white)
                            .frame(width: 100, height: 40)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.white]),
                                                       startPoint: .bottom,
                                                       endPoint: .topTrailing))
                            .cornerRadius(10)
                            .onAppear{
                               
                            }
                    }
                    .disabled(!game.isCheck)
                    
                    HStack {
                        Button {
                            if game.questionNumber > 0 {
                                game.questionNumber -= 1
                                game.selectedAnswer = game.selectOption[game.questionNumber]
                                game.isCheck = false
                                game.isAnswered = !game.selectedAnswer!.isEmpty
                            }
                        } label: {
                            Text("Back")
                                .font(.system(size: 20, weight: .black))
                                .foregroundStyle(.white)
                                .frame(width: 100, height: 40)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.white]),
                                                           startPoint: .bottom,
                                                           endPoint: .topTrailing))
                                .cornerRadius(10)
                        }
                        .disabled(game.questionNumber == 0)
                        .offset(x : -60  , y : -60)
                        
                        Button {
                            if game.questionNumber < game.Question.count - 1 {
                                game.questionNumber += 1
                                game.selectedAnswer = game.selectOption[game.questionNumber]
                                game.isAnswered = !game.selectedAnswer!.isEmpty
                                game.isCheck = false

                            }
                        } label: {
                            Text("Next")
                                .font(.system(size: 20, weight: .black))
                                .foregroundStyle(.white)
                                .frame(width: 100, height: 40)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.white]),
                                                           startPoint: .bottom,
                                                           endPoint: .topTrailing))
                                .cornerRadius(10)
                        }
                        .disabled(!game.isAnswered)
                        .offset(x : 60  , y : -60)
                    }
                }
                .padding()
                NavigationLink(destination: Test1(), isActive: $navigateToGame) {
                    EmptyView()
                }
                
            }
        }
    }
}

struct Test1: View {
    @StateObject var game : backendViewModel = backendViewModel()
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.pink, Color.white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                Text("Your Score is:")
                    
                    .font(.system(size: 36 , weight: .black))
                    .padding(.top, -60)
                    .onAppear {
                        print(" Score = \(game.score)")
                    }
                Text("\(game.score) / \(game.Question.count)")
                    .font(.system(size: 36 , weight: .black))
            }
    }
}

#Preview {
    Test()
}

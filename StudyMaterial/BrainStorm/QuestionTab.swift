//
//  QuestionTab.swift
//  StudyMaterial
//
//  Created by Jeevith  on 01/03/25.
//

import SwiftUI

class BackendViewModel: ObservableObject {
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

struct QuestionTab: View {
    @ObservedObject var game : BackendViewModel = BackendViewModel()
    @State var Scorestore : Int = 0
    @State var showNextPage : Bool = false
    var body: some View {
        ZStack
        {
            Text("BrainStorm")
                .font(.system(size: 38, weight: .black))
                .shadow(color : .white , radius: 5)
                .offset(x: 0, y: -350)
            
            Image("QUIZ2")
                .resizable()
                .frame(width: 450, height: 310)
                .padding()
                .offset(x: 0, y: -170)
            
            Image("brain")
                .resizable()
                .frame(width: 150, height: 250)
                .offset(x: 120, y: -320)
            
            Text("\(game.questionNumber + 1).\(game.Question[game.questionNumber])")
                .rotationEffect(.degrees(-3))
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.black)
                .frame(width: 350, height: 150)
                .shadow(color: .yellow, radius: 2)
                .offset(x: 0, y: -190)
            
            VStack(spacing: -20) {
                ForEach(game.Option[game.questionNumber], id: \.self) { option in
                    Button(action: {
                        if !game.isAnswered {
                            game.selectedAnswer = option
                            game.isCheck = true
                        }
                    }) {
                        Image("QUIZ2")
                            .resizable()
                            .frame(width: 400, height: 90)
                            .offset(x: 0, y: 5)
                            .overlay {
                            Text(option)
                                    .frame(width: 300, height: 80)
                                    .font(.system(size: 17, weight: .bold, design: .default))
                                .foregroundColor(game.getButtonColor(for: option))
                                .shadow(color: .yellow, radius: 2)
                            }
                    }
                    .disabled(game.isAnswered)
                }
            }
            .offset(x: 0, y: 70)
            
            Button {
                game.correctAnswer()
                
            } label: {
                Image("QUIZ3")
                    .resizable()
                    .frame(width: 150, height: 100)
                    .overlay {
                        Text("Check")
                            .font(.system(size: 20, weight: .black))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                
            }
            .disabled(!game.isCheck)
            .offset(x: 0, y: 300)
            
            HStack {
                Button {
                    if game.questionNumber > 0 {
                        game.questionNumber -= 1
                        game.selectedAnswer = game.selectOption[game.questionNumber]
                        game.isCheck = false
                        game.isAnswered = !game.selectedAnswer!.isEmpty
                    }
                } label: {
                    Image("QUIZ3")
                        .resizable()
                        .frame(width: 150, height: 100)
                        .overlay {
                            Text("back")
                                .font(.system(size: 20, weight: .black))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                }
                .disabled(game.questionNumber == 0)
                .offset(x : -40  , y : 300)
                
                Button {
                    if game.questionNumber < game.Question.count - 1 {
                        game.questionNumber += 1
                        game.selectedAnswer = game.selectOption[game.questionNumber]
                        game.isAnswered = !game.selectedAnswer!.isEmpty
                        game.isCheck = false

                    }
                    else
                    {
                        showNextPage = true
                    }
                } label: {
                    Image("QUIZ3")
                        .resizable()
                        .frame(width: 150, height: 100)
                        .overlay {
                            Text("next")
                                .font(.system(size: 20, weight: .black))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                }
                .disabled(!game.isAnswered)
                .offset(x : 40  , y : 300)
            }
            .fullScreenCover(isPresented: $showNextPage) {
                Score(score: game.score)
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.yellow)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    QuestionTab()
}

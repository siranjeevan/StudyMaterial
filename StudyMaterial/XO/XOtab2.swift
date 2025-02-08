//
//  XOtab2.swift
//  StudyMaterial
//
//  Created by Jeevith on 05/02/25.
//

import SwiftUI

class FrontendViewController: ObservableObject {
    let gradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.gray]),
        startPoint: .top,
        endPoint: .bottom
    )
    @Published public var boardgrid : [[String]] = []

    init() {
        self.boardgrid = Array(repeating: Array(repeating: "-", count: 3), count: 3)
    }
    
    func ButtonShow(i : Int) -> some View {
        ForEach(0..<3){ j in
            Button {

            } label: {
                Text("\(self.boardgrid[i][j])")
                    .font(.system(size: 70))
                    .foregroundColor(.white)
            }
        }
        
    }

    func BoardShow() -> some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .bold()
                .padding()
                .background(gradient)
                .frame(maxWidth: .infinity)

            LazyVGrid(columns: Array(repeating: GridItem(.fixed(100), spacing: 10), count: 3), spacing: 10) {
                ForEach(0..<3) { i in
                    self.ButtonShow(i : i)
                            .frame(width: 100, height: 100)
                            .background(Color.gray)
                            .cornerRadius(10)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

class backendViewController{
    func setcoin( _ move: Int)
        {
            
        }
    func validateMove(_ move: Int) -> Bool {
        return true
    }
    func PlayerSwap()
    {
        
    }
}

struct XOtab2: View {
    @StateObject var viewModel = FrontendViewController()
    @State var player = "X"
    
    var body: some View {
        viewModel.BoardShow()
    }
}

#Preview {
    XOtab2()
}

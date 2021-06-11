//
//  ContentView.swift
//  Milestone-Projects-1-3-SwiftUI
//
//  Created by Baris Karalar on 11.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var appChoice = Int.random(in: 0...2)
    
    @State private var playerScore = 0
    @State private var noOfQuestionsAsked = 0
    @State private var showingScore = false
    
    var possibleMoves = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        
        VStack {
            
            Text("Player score is: \(playerScore) ")
  
            Text("App's move: \(possibleMoves[appChoice])")
            
            ForEach(0 ..< 3) { position in
                Button(action: {
                    buttonTapped(position)

                }, label: {
                    Text("\(possibleMoves[position])")
                })
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            
            
            
        }
        .alert(isPresented: $showingScore, content: {
            Alert(title: Text("Game over"), message: Text("The score is: \(playerScore)"), dismissButton: .default(Text("Start again")) {
                noOfQuestionsAsked = 0
                print("Game ended")
            })
        })
        
        
    }
    
    func buttonTapped(_ playerChoice: Int) {

        if playerChoice > appChoice && playerChoice - appChoice == 1 {
            print("player won 1")
            playerScore += 1
        } else if playerChoice > appChoice {
            print("app won 2")
            playerScore -= 1
        } else if playerChoice < appChoice && appChoice - playerChoice == 1 {
            print("app won 3")
            playerScore -= 1
        } else if playerChoice < appChoice {
            print("player won 4")
            playerScore += 1
        }
        else {
            print("tie 5")
        }
        noOfQuestionsAsked += 1
        appChoice = Int.random(in: 0...2)
        if noOfQuestionsAsked == 10 {
            showingScore = true
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

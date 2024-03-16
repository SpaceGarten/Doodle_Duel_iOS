//
//  GameOverView.swift
//  DoodleDuel
//
//  Created by Matthew Morikan on 2024-03-06.
//

import Foundation
import SwiftUI

struct GameOverView: View {
    @ObservedObject var matchManager: MatchManager

    var body: some View {
        VStack {
            Spacer()
            
            Image("gameOver")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 70)
                .padding(.vertical)
            
            Text("Score: \(matchManager.score)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color("primaryYellow"))
            
            Spacer()
            
            Button {
                matchManager.resetGame()
            } label: {
                Text("Menu")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("menuBtn"))
                    .brightness(-0.4)
                    
                
            }
            .padding()
            .padding(.horizontal, 50)
            .background(
                Capsule(style: .circular)
                    .fill(Color("menuBtn"))
            )
       
            Spacer()
            
        }
        
        .background(
            Image("gameOverBg")
                .resizable()
                .scaledToFill()
                .scaleEffect(1.1)
        )
        
        .ignoresSafeArea()
    }
    
}



struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(matchManager: MatchManager())
    }
}

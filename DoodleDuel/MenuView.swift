//
//  MenuView.swift
//  DoodleDuel
//
//  Created by Matthew Morikan on 2024-03-06.
//

import Foundation
import SwiftUI

struct MenuView: View {
    @ObservedObject var matchManager: MatchManager
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("Logo2")
                .resizable()
                .scaledToFit()
                .padding()

            Spacer()
            
            Button {
                matchManager.startMatchMaking()
            } label: {
                Text("PLAY")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
            }
            .disabled(matchManager.authenticationState != .authenticated || matchManager.inGame)
            .padding(.vertical, 20)
            .padding(.horizontal, 100)
            .background(
                Capsule(style: .circular)
                    .fill((matchManager.authenticationState != .authenticated || matchManager.inGame) ? .cyan : Color("playBtn"))
            )
            Text(matchManager.authenticationState.rawValue)
                .font(.headline.weight(.semibold))
                .foregroundColor(Color("primaryGreen"))
                .padding()
            
            Spacer()
            
        }
        
        .background(
            .white
        )
        
        .ignoresSafeArea()
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(matchManager: MatchManager())
    }
}

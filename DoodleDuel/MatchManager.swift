//
//  MatchManager.swift
//  DoodleDuel
//
//  Created by Matthew Morikan on 2024-03-06.
//

import Foundation


class MatchManager: NSObject, ObservableObject {
    @Published var inGame = true
    @Published var isGameOver = false
    @Published var isTimeKeeper = false
    @Published var authenticationState = PlayerAuthState.authenticating
    
    @Published var currentlyDrawing = true
    @Published var drawPrompt = "vacuum"
    @Published var pastGuesses = [PastGuess]()
    
    @Published var score = 0
    
    @Published var remainingTime = maxTimeRemaining
}

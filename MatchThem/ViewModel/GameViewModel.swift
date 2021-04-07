//
//  GameViewModel.swift
//  MatchThem
//
//  Created by Yann Christophe Maertens on 07/04/2021.
//

import SwiftUI
import AVFoundation

class GameViewModel: ObservableObject {
    @Published var difficulty = difficulties[0]
    @Published var cards = [CardGame]()
    @Published var audioPlayer : AVAudioPlayer!
    
    func CardGameSystem() {
        
        // Filter cards returned
        let faceCards = cards.filter { $0.state == .head }
        
        // check if cards are the same, match them if true, return them if false
        if faceCards.count == difficulty.number && Set(faceCards).count <= 1 {
            cards.indices.filter { cards[$0].state == .head }.forEach { cards[$0].state = .matched }
            playSound(soundFileName: "GP_Connected.wav")
        }
        else {
            if faceCards.count == difficulty.number {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.cards.indices.filter { self.cards[$0].state != .matched }.forEach { self.cards[$0].state = .tail }
                    self.playSound(soundFileName: "GP_Disconnected.wav")
                }
            }
        }
        
        // Check if game is won
        if cards.allSatisfy( { $0.state == .matched } ) {
            
        }
    }
    func startCardGame() {
        var newCards = Array(repeating: CardGame(image: ""), count: difficulty.number * 5)
        
        let images = ["hourglass", "figure.walk", "moon", "person", "cloud"]
        
        let allImages = Array(Array(repeating: images, count: difficulty.number).joined())
        
        newCards.indices.forEach { newCards[$0].image = allImages[$0] }
        
        cards = newCards.shuffled()
    }
    func playSound(soundFileName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
            fatalError("Unable to find \(soundFileName) in bundle")
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error.localizedDescription)
        }
        audioPlayer.volume = 0.2
        audioPlayer.play()
    }
    
    init() {
        startCardGame()
    }
}

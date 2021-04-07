//
//  GameModel.swift
//  MatchThem
//
//  Created by Yann Christophe Maertens on 07/04/2021.
//

import SwiftUI

struct CardGame: Identifiable, Hashable {
    var id = UUID()
    static let title = "MATCH PAIRS"
    var state = CardState.tail
    var image: String
}

enum CardState {
    case tail
    case head
    case matched
}

struct Difficulty: Hashable {
    var name: String
    var color: Color
    var number: Int
}

var difficulties : [Difficulty] = [
    Difficulty(name: "EASY", color: .yellow, number: 2),
    Difficulty(name: "MEDIUM", color: .orange, number: 3),
    Difficulty(name: "HARD", color: .red, number: 4)
]

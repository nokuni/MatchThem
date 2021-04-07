//
//  CardView.swift
//  MatchThem
//
//  Created by Yann Christophe Maertens on 07/04/2021.
//

import SwiftUI

struct CardView: View {
    var card : CardGame
    var difficulty: Difficulty
    var body: some View {
        ZStack {
            if card.state == .tail {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(difficulty.color)
                    .frame(width: 80, height: 80)
                    .shadow(color: .black, radius: 0, x: 2.0, y: 2.0)
                Image(systemName: "questionmark")
                    .foregroundColor(.black)
                    .font(.system(size: 50))
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(card.state == .matched ? .green : .white)
                    .frame(width: 80, height: 80)
                    .shadow(color: .black, radius: 0, x: 2.0, y: 2.0)
                Image(systemName: card.image)
                    .renderingMode(.original)
                    .font(.system(size: 50))
            }
        }
        .rotation3DEffect(.degrees(card.state == .tail ? 0 : 180), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CardGame(image: "person"), difficulty: difficulties[0])
    }
}


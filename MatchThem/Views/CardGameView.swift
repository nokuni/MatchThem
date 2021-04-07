//
//  CardGameView.swift
//  MatchThem
//
//  Created by Yann Christophe Maertens on 07/04/2021.
//

import SwiftUI

struct CardGameView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    
    private var grid: [GridItem] {
        return Array(repeating: GridItem(.fixed(80)), count: viewModel.difficulty.number)
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text(CardGame.title)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .padding(.top)
                
                Spacer()
                
                DifficultyView()
                
                // Game grid
                
                VStack {
                    
                    LazyVGrid(columns: grid, alignment: .center, spacing: 10, pinnedViews: []) {
                        ForEach(0..<viewModel.cards.count, id: \.self) { index in
                            CardView(card: viewModel.cards[index], difficulty: viewModel.difficulty)
                                .onTapGesture {
                                    withAnimation {
                                        if viewModel.cards[index].state == .tail {
                                            viewModel.playSound(soundFileName: "GP_Draw_2.wav")
                                            viewModel.cards[index].state = .head
                                            viewModel.CardGameSystem()
                                        }
                                    }
                                }
                        }
                    }
                    
                }
                .frame(width: 380, height: 600)
                .background(Color.white.opacity(0.1))
                .background(RoundedRectangle(cornerRadius: 15).stroke(viewModel.difficulty.color, lineWidth: 5))
                .cornerRadius(15)
                
                Spacer()
            }
            
        }
    }
}

struct CardGameView_Previews: PreviewProvider {
    static var previews: some View {
        CardGameView().environmentObject(GameViewModel())
    }
}

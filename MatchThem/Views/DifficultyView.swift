//
//  DifficultyView.swift
//  MatchThem
//
//  Created by Yann Christophe Maertens on 07/04/2021.
//

import SwiftUI

struct DifficultyView: View {
    @EnvironmentObject var viewModel : GameViewModel
    @Namespace var animation
    var body: some View {
        HStack {
            Text("EASY")
                .frame(width: 70, height: 40)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(viewModel.difficulty.name == "EASY" ? .black : .white)
                .frame(width: 120, height: 45)
                .background(
                    ZStack {
                        if viewModel.difficulty.name != "EASY" {
                            Color.clear
                        } else {
                            viewModel.difficulty.color
                                .cornerRadius(10)
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
                .onTapGesture {
                    withAnimation {
                        viewModel.difficulty = difficulties[0]
                        viewModel.startCardGame()
                    }
                }
            
            Text("MEDIUM")
                .frame(width: 70, height: 40)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(viewModel.difficulty.name == "MEDIUM" ? .black : .white)
                .frame(width: 120, height: 45)
                .background(
                    ZStack {
                        if viewModel.difficulty.name != "MEDIUM" {
                            Color.clear
                        } else {
                            viewModel.difficulty.color
                                .cornerRadius(10)
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
                .onTapGesture {
                    withAnimation {
                        viewModel.difficulty = difficulties[1]
                        viewModel.startCardGame()
                    }
                }
            
            Text("HARD")
                .frame(width: 70, height: 40)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(viewModel.difficulty.name == "HARD" ? .black : .white)
                .frame(width: 120, height: 45)
                .background(
                    ZStack {
                        if viewModel.difficulty.name != "HARD" {
                            Color.clear
                        } else {
                            viewModel.difficulty.color
                                .cornerRadius(10)
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
                .onTapGesture {
                    withAnimation {
                        viewModel.difficulty = difficulties[2]
                        viewModel.startCardGame()
                    }
                }
        }
        .background(Color.white.opacity(0.15))
        .cornerRadius(15)
        .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.black))
    }
}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView().environmentObject(GameViewModel())
    }
}

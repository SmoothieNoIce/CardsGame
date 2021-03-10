//
//  GameOverView.swift
//  CardsGame
//
//  Created by User22 on 2021/3/10.
//

import SwiftUI

struct GameOverView: View {
    
    @Binding var isShowGameOver :Bool

    var body: some View {
        ZStack{
            Color.yellow.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Text("game over")
        }.overlay(
            Button(
                action:{isShowGameOver = false},
                label:{
                    Image(systemName:"xmark.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .padding(20)
            })
            ,alignment: .topTrailing
        )
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(isShowGameOver: .constant(true))
    }
}

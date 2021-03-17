//
//  GameOverView.swift
//  CardsGame
//
//  Created by User22 on 2021/3/10.
//

import SwiftUI

struct GameOverView: View {
    
    @Binding var isShowGameOver :Bool
    @Binding var isNotStart :Bool
    @Binding var money :Int
    var body: some View {
        ZStack{
            Color.yellow.edgesIgnoringSafeArea(.all)
            VStack{
                Text("lose!")
                Text("money:\(money)")
            }
        }.overlay(
            Button(
                action:{
                    isShowGameOver = false
                    isNotStart=true
                },
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
        GameOverView(isShowGameOver: .constant(true),isNotStart: .constant(false),money: .constant(100))
    }
}

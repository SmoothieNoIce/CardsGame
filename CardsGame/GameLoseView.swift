//
//  GameLoseView.swift
//  CardsGame
//
//  Created by User22 on 2021/3/17.
//

import SwiftUI

struct GameLoseView: View {
    @Binding var isShowGameLose :Bool
    @Binding var gaming :Int
    @Binding var money :Int
    var body: some View {
        ZStack{
            Color.yellow.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("lose!")
                Text("money:\(money)")
            }
        }.overlay(
            Button(
                action:{
                    isShowGameLose = false
                    gaming = 1
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

struct GameLoseView_Previews: PreviewProvider {
    static var previews: some View {
        GameLoseView(isShowGameLose:.constant(true),gaming: .constant(0),money: .constant(100))
    }
}

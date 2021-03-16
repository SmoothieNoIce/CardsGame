//
//  GameWinView.swift
//  CardsGame
//
//  Created by User22 on 2021/3/16.
//

import SwiftUI

struct GameWinView: View {
    @Binding var isShowGameWin :Bool
    @Binding var isNotStart :Bool
    @Binding var money :Int
    var body: some View {
        ZStack{
            Color.yellow.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("win!")
                Text("money:\(money)")
            }
        }.overlay(
            Button(
                action:{
                    isShowGameWin = false
                    isNotStart=true},
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

struct GameWinView_Previews: PreviewProvider {
    static var previews: some View {
        GameWinView(isShowGameWin:.constant(true),isNotStart: .constant(false),money: .constant(100))
    }
}

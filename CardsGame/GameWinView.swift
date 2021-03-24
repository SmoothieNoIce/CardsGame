//
//  GameWinView.swift
//  CardsGame
//
//  Created by User22 on 2021/3/16.
//

import SwiftUI

struct GameWinView: View {
    @Binding var isShowGameWin :Bool
    @Binding var gaming :Int
    @Binding var money :Int
    var body: some View {
        ZStack{
            Image("card_table")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("u_win")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, alignment: .center)
                    .padding(3)
                Text("你贏惹! money+10")
                Text("money:\(money)")
            }
        }.overlay(
            Button(
                action:{
                    isShowGameWin = false
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

struct GameWinView_Previews: PreviewProvider {
    static var previews: some View {
        GameWinView(isShowGameWin:.constant(true),gaming: .constant(0),money: .constant(100)).preferredColorScheme(.dark).previewLayout(.fixed(width: 667, height: 375))
    }
}

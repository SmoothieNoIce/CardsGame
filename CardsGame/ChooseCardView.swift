//
//  ChooseCardView.swift
//  CardsGame
//
//  Created by User22 on 2021/3/11.
//

import SwiftUI

struct ChooseCardView: View {
    @Binding var player : Player

    var body: some View {
        ZStack(){
            ForEach(player.cardList.indices , id:\.self){ (index) in
                HStack{
                    Image("\(player.cardList[index].rank)_of_\(player.cardList[index].suit)")
                        .resizable()
                        .frame(width: 100, height: 145, alignment: .center)
                        .opacity(player.cardList[index].c)
                        .animation(.default)
                        .offset(x: CGFloat(index)*35, y:10-CGFloat(player.cardList[index].f))
                }
            }
        }.offset(x: -180, y: 180)
    }
}

struct ChooseCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseCardView(player: .constant(Player(id: 1, cardList: [Card]())))
    }
}

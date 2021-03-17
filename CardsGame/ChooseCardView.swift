//
//  ChooseCardView.swift
//  CardsGame
//
//  Created by User22 on 2021/3/11.
//

import SwiftUI

struct ChooseCardView: View {
    @Binding var gaming :Int
    @Binding var player : Player
    @Binding var selectedCard : Int

    var body: some View {
        ZStack{
            
            Image("card_table")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(){
                Text("抽一張牌").offset(x: 0, y: -100)
                HStack{
                    ForEach(player.cardList.indices , id:\.self){ (index) in
                            Button(action: {
                                selectedCard = index
                                gaming = 3
                            }){
                                Image("back_card")
                                    .resizable()
                                    .frame(width: 100, height: 145, alignment: .center)
                                    .opacity(player.cardList[index].c)
                                    .animation(.default)
                            }
                    }
                }.offset(x: 100, y: 0)
            }.offset(x: 0, y: 180)
       
        }
       
    }
}

struct ChooseCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseCardView(
            gaming: .constant(2),
            player: .constant(Player(id: 1, cardList: [Card]())),
            selectedCard: .constant(0)
        )
    }
}

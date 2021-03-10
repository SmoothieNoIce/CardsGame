//
//  InGameView.swift
//  CardsGame
//
//  Created by User22 on 2021/3/10.
//

import SwiftUI

struct Card : Identifiable,Hashable{
    let id = UUID()
    let suit:String
    let rank:String
    var c = 1.0
    var f = 0
}

let suits = ["clubs","diamonds","hearts","spades"]
let ranks = ["ace", "2", "3", "4", "5", "6", "7", "8", "9", "10","jack","queen", "king"]



struct InGameView: View {
    
    @State var order = 1
    @State var message = "棄牌"
    @State var player1 = [Card]()
    @State var player2 = [Card]()
    @State var player3 = [Card]()
    @State var player4 = [Card]()

    
    @State private var isShowGameOver = false
    @State private var isNotStart = true

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
            
            Text("\(message)").offset(x: 0, y: 50.0)
            
            Button(
                action:{
                    dropCard1()
                },
                label:{
                    Image(systemName:"xmark.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .padding(20)
            }).offset(x: 0, y: 80.0)
            
            ZStack(){
                ForEach(player1.indices , id:\.self){ (index) in
                    HStack{
                        Image("\(player1[index].rank)_of_\(player1[index].suit)")
                            .resizable()
                            .frame(width: 100, height: 145, alignment: .center)
                            .opacity(player1[index].c)
                            .animation(.default)
                            .offset(x: CGFloat(index)*35, y:10-CGFloat(player1[index].f))
                    }
                }
            }.offset(x: -180, y: 180)
            
            ZStack(){
                ForEach(player2.indices , id:\.self){ (index) in
                    HStack{
                        Image("back_card")
                            .resizable()
                            .frame(width: 100, height: 145, alignment: .center)
                            .opacity(player2[index].c)
                            .animation(.default)
                            .offset(x:10+CGFloat(player2[index].f), y: CGFloat(index)*20)
                            
                    }
                }
            }.offset(x: -430, y: -100)
            
            ZStack(){
                ForEach(player3.indices , id:\.self){ (index) in
                    HStack{
                        Image("back_card")
                            .resizable()
                            .frame(width: 100, height: 145, alignment: .center)
                            .opacity(player3[index].c)
                            .animation(.default)
                            .offset(x: CGFloat(index)*35, y:10+CGFloat(player3[index].f))
                    }
                }
            }.offset(x: -250, y: -200)
            
            
            ZStack(){
                ForEach(player4.indices , id:\.self){ (index) in
                    HStack{
                        Image("\(player4[index].rank)_of_\(player4[index].suit)")
                            .resizable()
                            .frame(width: 100, height: 145, alignment: .center)
                            .rotationEffect(.degrees(270))
                            .opacity(player4[index].c)
                            .animation(.default)
                            .offset(x:10-CGFloat(player4[index].f), y:-(CGFloat(index)*20))
                    }
                }
            }.offset(x: 430, y: 100)
        })
        .sheet(isPresented: $isShowGameOver, content: {
            GameOverView(isShowGameOver:$isShowGameOver)
        }).sheet(isPresented: $isNotStart, content: {
            ContentView(isNotStart:$isNotStart)
        })
        .onAppear(perform: {
            washCard()
        })
    }
    
    func washCard(){
        player1.removeAll()
        player2.removeAll()
        player3.removeAll()
        player4.removeAll()
        var cardList = [Card]()
        for suit in suits{
            for rank in ranks{
                cardList.append(Card(suit: suit, rank: rank))
            }
        }
        cardList.append(Card(suit: "joker", rank: "black"))
        cardList.shuffle()
        for i in 0...12{
            player1.append(cardList[i])
        }
        for i in 13...25{
            player2.append(cardList[i])
        }
        for i in 26...38{
            player3.append(cardList[i])
        }
        for i in 38...51{
            player4.append(cardList[i])
        }
        player1.append(cardList[52])
    }
    
    func dropCard1(){
        var list1 = player1
        var list2 = player1
        var list3 = [Card]()
        for i in 0...list1.count-1{
            var found = false
            for j in 0...list2.count-1{
                if list1[i].rank == list2[j].rank{
                    found = true
                    break
                }
            }
            if !found{
                list3.append(list1[i])
            }
                
        }
        player1 = list3
    }
    
}

struct InGameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InGameView()
                .preferredColorScheme(.dark).previewLayout(.fixed(width: 667, height: 375))
        }
    }
}

struct CircleImage: View {
    var body: some View {
        Image(systemName: "pencil")
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .shadow(radius: 20)
    }
}

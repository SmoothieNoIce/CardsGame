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

struct Player{
    var id :Int
    var cardList = [Card]()
}

struct DropCard{
    var card1:Card
    var card2:Card
}

let suits = ["clubs","diamonds","hearts","spades"]
let ranks = ["ace", "2", "3", "4", "5", "6", "7", "8", "9", "10","jack","queen", "king"]



struct InGameView: View {
    
    @State var gaming = 1
    @State var order = 0
    @State var message = "開始遊戲"
    @State var showGetCard = false
    @State var selectedCard = Card(suit:"",rank: "")
    @State var playerList: [Player] = [
        Player(id: 0, cardList: [Card]()) ,
        Player(id: 1, cardList: [Card]()) ,
        Player(id: 2, cardList: [Card]()) ,
        Player(id: 3, cardList: [Card]()) ,
    ]
    
    @State private var isShowGameOver = false
    @State private var isNotStart = true
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
            
            
            Text("\(message)").offset(x: 0, y: 0.0)
            
            Button(
                action:{
                },
                label:{
                    Image(systemName:"pencil")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .padding(20)
                }).offset(x: 0, y: 80.0)
            
            ZStack(){
                ForEach(playerList[0].cardList.indices , id:\.self){ (index) in
                    HStack{
                        Image("\(playerList[0].cardList[index].rank)_of_\(playerList[0].cardList[index].suit)")
                            .resizable()
                            .frame(width: 100, height: 145, alignment: .center)
                            .opacity(playerList[0].cardList[index].c)
                            .animation(.default)
                            .offset(x: CGFloat(index)*35, y:10-CGFloat(playerList[0].cardList[index].f))
                    }
                }
            }.offset(x: -180, y: 180)
            
            ZStack(){
                ForEach(playerList[1].cardList.indices , id:\.self){ (index) in
                    HStack{
                        Image("back_card")
                            .resizable()
                            .frame(width: 100, height: 145, alignment: .center)
                            .opacity(playerList[1].cardList[index].c)
                            .animation(.default)
                            .offset(x:10+CGFloat(playerList[1].cardList[index].f), y: CGFloat(index)*20)
                        
                    }
                }
            }.offset(x: -430, y: -100)
            
            ZStack(){
                ForEach(playerList[2].cardList.indices , id:\.self){ (index) in
                    HStack{
                        Image("back_card")
                            .resizable()
                            .frame(width: 100, height: 145, alignment: .center)
                            .opacity(playerList[2].cardList[index].c)
                            .animation(.default)
                            .offset(x: CGFloat(index)*35, y:10+CGFloat(playerList[2].cardList[index].f))
                    }
                }
            }.offset(x: -250, y: -200)
            
            
            ZStack(){
                ForEach(playerList[3].cardList.indices , id:\.self){ (index) in
                    HStack{
                        Image("back_card")
                            .resizable()
                            .frame(width: 100, height: 145, alignment: .center)
                            .rotationEffect(.degrees(270))
                            .opacity(playerList[3].cardList[index].c)
                            .animation(.default)
                            .offset(x:10-CGFloat(playerList[3].cardList[index].f), y:-(CGFloat(index)*20))
                    }
                }
            }.offset(x: 430, y: 100)
        }).onChange(of: gaming, perform: { newValue in
            switch newValue{
                case 0: message = "開始遊戲"
                case 1: message = "棄牌"
                case 2:
                    message = "玩家抽牌"
                    showGetCard = true
                case 3:
                    showGetCard = false
                    message = "電腦抽牌"
                    
                default: message = ""
            }
        })
        .onChange(of: isNotStart){ newValue in
            if(newValue == false){
                gaming = 1
                dropCard1()
            }
        }
        .onAppear(perform: {
            washCard()
            //dropCard1()
        })
        EmptyView().sheet(isPresented: $isShowGameOver, content: {
            GameOverView(isShowGameOver:$isShowGameOver)
        })
        EmptyView().sheet(isPresented: $showGetCard, content: {
            ChooseCardView(gaming:$gaming,player:$playerList[1],selectedCard: $selectedCard)
        })
        EmptyView().sheet(isPresented: $isNotStart, content: {
           ContentView(isNotStart:$isNotStart)
        })

        
    }
    
    func washCard(){
        
        for i in 0...3{
            playerList[i].cardList.removeAll()
        }
        var cardList = [Card]()
        for suit in suits{
            for rank in ranks{
                cardList.append(Card(suit: suit, rank: rank))
            }
        }
        cardList.append(Card(suit: "joker", rank: "black"))
        cardList.shuffle()
        for i in 0...12{
            playerList[0].cardList.append(cardList[i])
        }
        for i in 13...25{
            playerList[1].cardList.append(cardList[i])
        }
        for i in 26...38{
            playerList[2].cardList.append(cardList[i])
        }
        for i in 38...51{
            playerList[3].cardList.append(cardList[i])
        }
        playerList[0].cardList.append(cardList[52])
    }
    
    func dropCard1(){
        for i in 0...3{
            dropCard2(playerIndex: i)
        }
    }
    
    func dropCard2(playerIndex:Int){
        var isNoDoubleCard = true
        var list1 = playerList[playerIndex].cardList
        var list2 = [DropCard]()
        while isNoDoubleCard{
            outerLoop: for i in 0...list1.count-1{
                if i==list1.count-1{
                    isNoDoubleCard = false
                    break outerLoop
                }
                for j in i+1...list1.count-1{
                    if list1[i].rank == list1[j].rank{
                        list2.append(DropCard(card1: list1[i], card2: list1[j]))
                        list1.remove(at: j)
                        list1.remove(at: i)
                        break outerLoop
                    }
                }
            }
        }
        for i in 0...list2.count-1{
            delay(Double(i)*0.5)
            {
                for j in 0...playerList[playerIndex].cardList.count-1{
                    if playerList[playerIndex].cardList[j].rank == list2[i].card1.rank && playerList[playerIndex].cardList[j].suit == list2[i].card1.suit{
                        playerList[playerIndex].cardList[j].c = 0
                        playerList[playerIndex].cardList[j].f = 100
                    }
                    if playerList[playerIndex].cardList[j].rank == list2[i].card2.rank && playerList[playerIndex].cardList[j].suit == list2[i].card2.suit{
                        playerList[playerIndex].cardList[j].c = 0
                        playerList[playerIndex].cardList[j].f = 100
                    }
                }
            }
        }
        delay(2.5, closure: {
            playerList[playerIndex].cardList = list1
            gaming = 2
        })
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
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







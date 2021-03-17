//
//  ContentView.swift
//  CardsGame
//
//  Created by User22 on 2021/3/10.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Binding var isNotStart :Bool
    @Binding var money :Int

    var body: some View {
        ZStack{
            Image("card_table")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("appstore")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding(40)
                Text("抽鬼牌")
                Button(
                    action:{
                        isNotStart = false
                    },
                    label:{Text("開始遊戲")
                        .foregroundColor(Color.white)
                        .padding(.all, 9.0)
                    })
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                
                Link(destination: URL(string: "https://zh.wikipedia.org/wiki/%E6%BD%9B%E7%83%8F%E9%BE%9C")!, label: {
                            VStack {
                                Text("規則")
                                    .foregroundColor(Color.white)
                                    .padding(.all, 9.0)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(10)
                            }
                })

            }
        }

    }

}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(isNotStart: .constant(false),money: .constant(100))
           
        }
    }
}



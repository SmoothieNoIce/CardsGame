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

    var body: some View {
        ZStack{
            VStack{
                Button(
                    action:{isNotStart = false},
                    label:{Text("開始遊戲")
                        .foregroundColor(Color.white)
                        .padding(.all, 9.0)
                    })
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
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
            ContentView(isNotStart: .constant(false))
           
        }
    }
}



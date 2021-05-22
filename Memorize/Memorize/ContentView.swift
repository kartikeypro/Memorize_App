//
//  ContentView.swift
//  Memorize
//
//  Created by kartikey Garg on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🛵","🚛","🛺","✈️","🚗","🚕","🚙",
                  "🚌","🚎","🏎","🚓","🚑","🚒","🚐",
                  "🛻","🚀","🛸","🚁","🛶","⛵️","🚤",
                  "🛥","🛳","🚢"]
    
    @State var emojiCount = 13
    
    var body: some View {
        VStack{
                Text("Memorize!").font(.largeTitle).foregroundColor(.black)
                ScrollView
                {
                    LazyVGrid(columns:[GridItem(.adaptive(minimum: 75))]){
                        ForEach(emojis.shuffled()[0..<emojiCount],id:\.self) {emoji in cardView(Content: emoji).aspectRatio(2/3,contentMode: .fit)}
                    }
                }
                Spacer()
            ScrollView(.horizontal){
                HStack{
                    transport
//                    add
                    Spacer()
//                    remove
                    face
                    Spacer()
                    tech
                    add
                    Spacer()
                    remove
                }.padding(.horizontal)
                .font(.largeTitle)
            }
        }.padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var transport: some View{
        Button(action:{ emojis = ["🛵","🚛","🛺","✈️","🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚀","🛸","🚁","🛶","⛵️","🚤","🛥","🛳","🚢"]}, label: {
            VStack{
            Image(systemName: "car.fill")
                Text("Transport").font(.footnote)
            }
        }).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
    
    var face: some View{
        Button(action: {emojis=["😃","😁","😅","🤣","😇","😍","🧐","🤓","🤩","🥳","😟","🤯","🥶","😶‍🌫️","😈","🤡","💀","😹","😬","😷","😠","🤕","🤑"]}, label: {
            VStack{
            Image(systemName: "face.smiling.fill")
                Text("Face").font(.footnote)
            }
        }).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
    var tech: some View{
        Button(action: {emojis=["⌚️","📱","💻","⌨️","🖥","🖨","📺","☎️","📷","💾","💽","🖱","🔦","📡","📲","🎥","📻","🎙","🔌","🛢","🔬","🛠","🔭"]}, label: {
            VStack{
            Image(systemName: "tv")
                Text("Tech").font(.footnote)
            }
        }).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count{
                emojiCount += 1}}, label:{
        Image(systemName: "plus.circle")
                }).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }

    var remove: some View{
        Button(action: {
            if emojiCount > 1{
                emojiCount -= 1}}, label: {
            Image(systemName: "minus.circle")
                }).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}
//This function is used to define the rectangle containers
struct cardView:View {
    var Content: String
    @State var isFaceUp : Bool = true
    
    var body: some View{
            ZStack{
                let shape = RoundedRectangle(cornerRadius: 20)
                if isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    shape
                        .strokeBorder(lineWidth: 3)
                    Text(Content)
                        .font(.largeTitle)
                }
                else{
                    shape
                        .foregroundColor(.red)
                }
            }.onTapGesture {
                isFaceUp = !isFaceUp
            }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

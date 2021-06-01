//
//  ContentView.swift
//  Memorize
//
//  Created by kartikey Garg on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
//        VStack{
            //Text("Memorize!").font(.largeTitle).foregroundColor(.black)
            ScrollView
            {
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 75))]){
                    ForEach(viewModel.cards) {card in cardView(card: card)
                        .aspectRatio(2/3,contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)                }
                        
                    }
                }
            }.padding()
            Spacer()
//            ScrollView(.horizontal){
//                HStack{
////                    transport
////                    add
//                    Spacer(minLength: 75)
////                    remove
////                    face
//                    Spacer(minLength: 75)
////                    tech
//                    Spacer(minLength: 80)
////                    add
//                    Spacer(minLength: 80)
//                    remove
//                    Spacer(minLength: 15)
//                }.padding(.horizontal)
//                .font(.largeTitle)
//            }
//        }.padding(.horizontal)
//        .foregroundColor(.red)
    }
    
//    var transport: some View{
//        Button(action:{ emojis = ["🛵","🚛","🛺","✈️","🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🛻","🚀","🛸","🚁","🛶","⛵️","🚤","🛥","🛳","🚢"]}, label: {
//            VStack{
//            Image(systemName: "car.fill")
//                Text("Transport").font(.footnote)
//            }
//        }).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//    }
//
//    var face: some View{
//        Button(action: {emojis=["😃","😁","😅","🤣","😇","😍","🧐","🤓","🤩","🥳","😟","🤯","🥶","😶‍🌫️","😈","🤡","💀","😹","😬","😷","😠","🤕","🤑"]}, label: {
//            VStack{
//            Image(systemName: "face.smiling.fill")
//                Text("Face").font(.footnote)
//            }
//        }).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//    }
//    var tech: some View{
//        Button(action: {emojis=["⌚️","📱","💻","⌨️","🖥","🖨","📺","☎️","📷","💾","💽","🖱","🔦","📡","📲","🎥","📻","🎙","🔌","🛢","🔬","🛠","🔭"]}, label: {
//            VStack{
//            Image(systemName: "tv")
//                Text("Tech").font(.footnote)
//            }
//        }).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//    }
//    var add: some View {
//        Button(action: {
//            if emojiCount < emojis.count{
//                emojiCount += 1}}, label:{
//        Image(systemName: "plus.circle")
//                }).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//    }
//
//    var remove: some View{
//        Button(action: {
//            if emojiCount > 1{
//                emojiCount -= 1}}, label: {
//            Image(systemName: "minus.circle")
//                }).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//    }
}
//This function is used to define the rectangle containers
struct cardView:View {
    let card : MemoryGame<String>.Card
    
    var body: some View{
            ZStack{
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    shape
                        .strokeBorder(lineWidth: 3)
                        .foregroundColor(.red)
                    Text(card.content)
                        .font(.largeTitle)
                }
                else if card.isMatch{
                    shape.opacity(0)
                }
                else{
                    shape
                        .foregroundColor(.red)
                }
            }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game=EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}

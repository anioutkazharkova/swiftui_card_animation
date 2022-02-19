//
//  SingleCard.swift
//  CardsLive
//
//  Created by Anna Zharkova on 18.02.2022.
//

import SwiftUI

struct SingleCard: View {
    @State var cardModel: CardModel
    var body: some View {
        ZStack {
            Rectangle()
                .fill(cardModel.color)
                .cornerRadius(12)
                .frame(width: 330, height: 220)
           
            Text(cardModel.title)
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
                
        }.shadow(color: .gray, radius: 5, x: 1, y: 1)
    }
}

struct SingleCard_Previews: PreviewProvider {
    static var previews: some View {
        SingleCard(cardModel: CardModel(title: "some text", color: .yellow))
    }
}

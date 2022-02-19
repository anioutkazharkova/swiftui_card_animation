//
//  CardItem.swift
//  CardsLive
//
//  Created by Anna Zharkova on 18.02.2022.
//

import SwiftUI

struct CardItem: View {
    @State var item: CardModel
    
    var body: some View {
        VStack{
            Text(item.title)
        }.background(item.color)
    }
}


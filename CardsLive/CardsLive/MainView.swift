//
//  MainView.swift
//  CardsLive
//
//  Created by Anna Zharkova on 18.02.2022.
//

import SwiftUI

struct MainView: View {
    @State var move: Bool = false
    @State var viewState =  CGSize.zero
    @State var show = false
    
    struct Sizes {
        static let offsetYMove: CGFloat = -200
        
        static let offsetY: CGFloat = -15
        
        static let scalePortion: CGFloat = 0.1
        
        static let offset: CGFloat = 150
    }
    
    var models: [CardModel] = [CardModel(title: "Tap me", color: .black),
                               CardModel(title: "Blue", color: .blue),
                               CardModel(title: "Red one", color: .red),
                               CardModel(title: "Yellow one", color: .yellow),
                               CardModel(title: "Green one", color: .green)]
    
    var body: some View {
        NavigationView {
        ZStack {
            ForEach(models.indices.reversed(), id: \.self) { index in
            
                ZStack{
                SingleCard(cardModel: models[index])
                    .offset(x: 0, y: move ? CGFloat(index)*Sizes.offsetYMove : CGFloat(index)*Sizes.offsetY)
                    .offset(x: self.viewState.width, y: self.viewState.height)
                    .scaleEffect(move ? 1 : (1 - CGFloat(index) * Sizes.scalePortion))
                    .animation(.easeInOut(duration: 0.3))
                    .onTapGesture {
                        if index == 0 {
                        self.move.toggle()
                        }
                    }
                    .gesture(DragGesture().onChanged({ value in
                        self.viewState = value.translation
                        self.show = true
                    }).onEnded({ value in
                        self.viewState = .zero
                        self.show = false
                    }))
                
                }
                
            }
        }.offset(x: 0, y: move ? Sizes.offset : 0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
        }
    }
}

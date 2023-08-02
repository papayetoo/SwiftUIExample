//
//  Carousel.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/08/01.
//

import SwiftUI
import SDWebImageSwiftUI

struct Carousel: View {
    @State private var cards: [Card] = [
        .init(image: "https://the-edit.co.kr/wp-content/uploads/2023/03/new_batch.jpg"),
        .init(image: "https://the-edit.co.kr/wp-content/uploads/2023/03/new_batch.jpg"),
        .init(image: "https://the-edit.co.kr/wp-content/uploads/2023/03/new_batch.jpg"),
        .init(image: "https://the-edit.co.kr/wp-content/uploads/2023/03/new_batch.jpg"),
        .init(image: "https://the-edit.co.kr/wp-content/uploads/2023/03/new_batch.jpg"),
        .init(image: "https://the-edit.co.kr/wp-content/uploads/2023/03/new_batch.jpg"),
        .init(image: "https://the-edit.co.kr/wp-content/uploads/2023/03/new_batch.jpg"),
    ]
    
    private var scrollView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(cards) {
                    cardView($0)
                }
            }.frame(width: 400, height: 300)
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 15)
        .padding(.top, 30)
    }
    
    var body: some View {
        VStack {
            scrollView
//            ScrollView(.horizontal) {
//                HStack(spacing: 10) {
//                    ForEach(cards) {
//                        cardView($0)
//                    }
//                }.frame(width: 400, height: 300)
//            }
//            .scrollIndicators(.hidden)
//            .padding(.horizontal, 15)
//            .padding(.top, 30)
        }
    }
    
    @ViewBuilder
    func cardView(_ card: Card) -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            let minX = proxy.frame(in: .global).minX
            let url = URL(string: card.image)!
            
            let reducingWidth = (minX / 100) * 130
            let cappedWidth = min(reducingWidth, 130)
            
            let frameWidth = size.width - (minX > 0 ? cappedWidth : -cappedWidth)
        
            
            AnimatedImage(url: url)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .frame(width: frameWidth)
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel()
    }
}

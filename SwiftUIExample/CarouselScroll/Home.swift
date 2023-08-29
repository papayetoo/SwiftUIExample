////
////  Home.swift
////  SwiftUIExample
////
////  Created by 최최광현 on 2023/08/27.
////
//
//import SwiftUI
//
//// https://youtu.be/3zBSgXoSugU?si=FtG-bXQsxJSG2V5T
//struct Home: View {
//    @State private var searchText: String = ""
//    var body: some View {
//        ScrollView(.vertical) {
//            VStack(spacing: 15) {
//                HStack {
//                    Button(action: {}) {
//                        Image(systemName: "line.3.horizontal")
//                            .font(.title)
//                            .foregroundStyle(.blue)
//                    }
//                    HStack(spacing: 12) {
//                        Image(systemName: "magnifyingglass")
//                        TextField("Search", text: $searchText)
//                    }
//                    .padding(.horizontal, 15)
//                    .padding(.vertical, 10)
//                    .background(.ultraThinMaterial, in: Capsule())
//                }
//                Text("Where do you want to travel?")
//                    .font(.largeTitle.bold())
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.top, 10)
//                
//                // ParallX Carousel
//                GeometryReader { geometry in
//                    let size = geometry.size
//                    ScrollView(.horizontal) {
//                        HStack(spacing: 10) {
//                            ForEach(tripCards) { card in
//                                GeometryReader(content: { proxy in
//                                    let cardSize = proxy.size
//                                    let minX = proxy.frame(in: .local).minX * 1.4
//                                    Image(card.image)
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .offset(x: -minX)
//                                        .frame(width: cardSize.width, height: cardSize.height)
//                                        .clipShape(RoundedRectangle(cornerRadius: 16))
//                                        .shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 10)
//                                })
//                                .frame(width: size.width - 60, height: size.height - 50)
//                            }
//                        }
//                        .padding(.horizontal, 30)
//                        .frame(height: size.height, alignment: .top)
//                    }
//                    .scrollIndicators(.hidden)
//                }
//                .frame(height: 500)
//                .padding(.horizontal, -15)
//            }
//            .padding(15)
//        }
//        .scrollIndicators(.hidden)
//    }
//}
//
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}

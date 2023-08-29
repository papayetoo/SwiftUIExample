//
//  AlbumHome.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/08/29.
//

import SwiftUI

let sampleAlbums = [
    Album(title: "Title 1", image: "img1"),
    Album(title: "Title 1", image: "img2"),
    Album(title: "Title 1", image: "img3"),
    Album(title: "Title 1", image: "img4"),
    Album(title: "Title 1", image: "img2"),
    Album(title: "Title 1", image: "img2"),
]

let sampleText = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dignissim condimentum mi, tempor ornare lectus. Sed aliquet, nunc et efficitur dignissim, ligula neque vulputate mauris,
"""

struct AlbumHome: View {
    @State var albums: [Album] = sampleAlbums
    
    // MARK: Custom Scroller Properties
    @State var currentIndex: Int = .zero
    @State var currentAlbum: Album = sampleAlbums.first!
    
    var body: some View {
        VStack {
            Text(titleString)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 40)
            
            // MARK: custom scroller
            VStack {
                CustomScroller()
                    .zIndex(1)
                standView
                    .zIndex(0)
            }
            .padding(.horizontal, -15)
            .frame(height: 250)
            .zIndex(1)
            
            TabView {
                ForEach($albums) { $album in
                    CardView(album: album)
                        .offsetX { value, width in
                            if currentIndex == getIndex(album: album) {
                                //
                                var offset = (value > 0 ? -value: value)
                                offset = (-offset < 80 ? offset: -80)
                                album.diskOffset = offset
                            }
                            
                            if value == 0 && currentIndex != getIndex(album: album) {
                                withAnimation(.easeInOut(duration: 0.6)) {
                                    albums[currentIndex].showDisk  = false
                                    albums[currentIndex].diskOffset = .zero
                                    currentIndex = getIndex(album: album)
                                    currentAlbum = albums[currentIndex]
                                }
                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 1, blendDuration: 1).delay(0.4)) {
                                    albums[currentIndex].showDisk = true
                                }
                            }
                        }
                }
            }
            .padding(.horizontal, -15)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .zIndex(0)
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG"), ignoresSafeAreaEdges: .all)
        .onAppear {
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 1, blendDuration: 1).delay(0.4)) {
                albums[currentIndex].showDisk = true
            }
        }
    }
    
    func getIndex(album: Album) -> Int {
        return albums.firstIndex { album.id == $0.id } ?? 0
    }
    
    @ViewBuilder
    func CardView(album: Album) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text("Album")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray.opacity(0.6))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 5) {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: "star.fill")
                            .font(.system(size: 8))
                    }
                    
                    Text("Rating ")
                        .font(.caption)
                        .padding(.leading, 5)
                }
            }
            Text(album.title)
                .font(.title.bold())
            
            Label {
                Text("Ariana grade")
            } icon: {
                Text("By")
                    .foregroundColor(.gray.opacity(0.6))
            }
            .padding(.top, 12)
            
            Text(sampleText)
                .foregroundColor(.gray.opacity(0.7))
                .padding(.top, 20)
            
            HStack {
                ForEach(["Punk", "Rock", "R&B"], id: \.self) { tag in
                    Toggle(tag, isOn: .constant(false))
                        .toggleStyle(.button)
                        .buttonStyle(.bordered)
                        .tint(.gray)
                        .font(.caption)
                }
            }
            
            Spacer(minLength: .zero)
        }
        .padding(.top, 20)
        .padding([.horizontal, .bottom])
        .background {
            CustomCorner(corners: [.bottomLeft, .bottomRight], radius: 25)
                .fill(.white.opacity(0.6))
        }
        .frame(width: .infinity,
               height: .infinity,
               alignment: .top)
        .padding(.horizontal, 30)
    }
    
    // MARK: Custom Scroller Animated View
    // Why using @ViewBuilder
    // Since it will update to @State updates
    @ViewBuilder
    func CustomScroller() -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            LazyHStack(spacing: 10) {
                ForEach($albums) { $album in
                    HStack(spacing: 6) {
                        Image(album.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 160, height: 180)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 10)
                            .zIndex(1)
                        
                        Image("disk")
                            .resizable()
                            .frame(width: 160, height: 180)
                            .overlay {
                                Image(album.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            }
                            .rotationEffect(.init(degrees: album.showDisk ? 40 : 0))
                            .offset(x: album.diskOffset)
                            .offset(x: album.showDisk ? 80 : 0)
                            .padding(.leading, -170)
                            .zIndex(0)
                    }
                    .offset(x: album.showDisk ? -40 : 0)
                    .frame(width: size.width, alignment: currentIndex > getIndex(album: album) ? .trailing : currentIndex == getIndex(album: album) ? .center : .leading)
                    .scaleEffect(currentAlbum.id == album.id ? 1 : 0.8, anchor: .bottom)
                    .offset(x: currentIndex > getIndex(album: album) ? 100 : currentIndex == getIndex(album: album) ? .zero : -40)
                }
            }
            .offset(x: CGFloat(currentIndex) * -size.width)
        }
        .frame(height: 180)
    }
    
    
    // MARK: custom view like wooden board
    var standView: some View {
        Rectangle()
            .fill(.white.opacity(0.6))
            .shadow(color: .black.opacity(0.85), radius: 20, x: 0, y: 5)
            .frame(height: 10)
            .overlay(alignment: .top) {
                Rectangle()
                    .fill(.white.opacity(0.75).gradient)
                    .frame(height: 385)
                    .rotation3DEffect(.init(degrees: -98), axis: (x: 1, y: 0, z: 0), anchor: .top, anchorZ: 0.5, perspective: 1)
                    .shadow(color: .black.opacity(0.08), radius: 25, x: 0, y: 5)
                    .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 15)
            }
    }
    
    var titleString: AttributedString {
        var attrString = AttributedString(stringLiteral: "My Library")
        if let range = attrString.range(of: "Library") {
            attrString[range].font = .largeTitle.bold()
        }
        return attrString
    }
}

struct AlbumHome_Previews: PreviewProvider {
    static var previews: some View {
        AlbumHome()
    }
}


// Custom Extension for Finding Horizontal offset

extension View {
    func offsetX(completion: @escaping (CGFloat, CGFloat) -> ()) -> some View {
        self.overlay {
            GeometryReader { proxy in
                Color.clear
                    .preference(key: OffsetXKey.self, value: proxy.frame(in: .global    ).minX)
                    .onPreferenceChange(OffsetXKey.self) { value in
                        completion(value, proxy.size.width)
                    }
            }
        }
    }
}

struct OffsetXKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

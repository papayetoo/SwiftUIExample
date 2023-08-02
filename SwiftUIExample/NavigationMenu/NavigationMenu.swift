//
//  NavigationMenu.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/20.
//

import SwiftUI

struct NavigationMenu: View {
    @State var size = UIScreen.main.bounds.width / 1.6
    @State var shown = false
    
    
    var body: some View {
        ZStack {
            Color.orange
            NavigationView {
                List(0..<5) { _ in
                    Text("Hello")
                }
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    self.shown.toggle()
                }) {
                    Text("Menu")
                })
            }
            if shown {
                HStack {
                    Spacer()
                    
                    Menu(size: $size) {
                        self.shown.toggle()
                    }
                    .padding(.leading, -size)
                }
                .animation(.spring(blendDuration: 3), value: shown)
            }
        }
    }
}

struct NavigationMenu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMenu()
    }
}

struct Menu: View {
    
    @Binding var size: CGFloat
    var action: () -> Void
     
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    action()
                }) {
                    Image(systemName: "xmark")
                        .tint(Color.black)
                }
            }
            .padding(.trailing, 20)
            
            HStack {
                Image(systemName: "seal")
                Text("설정")
                Spacer()
            }
            HStack {
                Image(systemName: "hexagon")
                Text("설정")
                Spacer()
            }
            HStack {
                Image(systemName: "paperplane.fill")
                Text("공유하기")
                Spacer()
            }
            
            Spacer()
        }
        .frame(width: size)
        .background(Color.white.opacity(0.8))
        .gesture(swipeRightToDismiss)
    }
    
    var swipeRightToDismiss: some Gesture {
        DragGesture()
            .onChanged { gesture in
                guard gesture.location.x < size else { return }
                size = gesture.translation.width
            }
    }
}

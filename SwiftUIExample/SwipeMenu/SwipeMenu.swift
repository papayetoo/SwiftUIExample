//
//  SwipeMenu.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/20.
//

import SwiftUI

struct SwipeMenu: View {
    @State var height = UIScreen.main.bounds.height - 300
    
    var body: some View {
        ZStack {
            Color.orange
            VStack {
                Spacer()
                Swipe()
                    .cornerRadius(20)
                    .padding(15)
                    .offset(y: height)
                    .gesture(DragGesture().onChanged({ value in
                        if value.translation.height > 0 {
                            self.height = value.translation.height
                        } else {
                            let temp = UIScreen.main.bounds.height - 100
                            self.height = temp + value.translation.height
                            // In upwards value will be negative so we
                        }
                    }).onEnded({ value in
                        if value.translation.height > 0 {
                            if value.translation.height > 200 {
                                self.height = UIScreen.main.bounds.height - 130
                            } else {
                                self.height = 15
                            }
                        } else {
                            if value.translation.height < 200 {
                                self.height = 15
                            } else {
                                self.height = UIScreen.main.bounds.height - 130
                            }
                        }
                    }))
            }
        }
    }
}

struct SwipeMenu_Previews: PreviewProvider {
    static var previews: some View {
        SwipeMenu()
    }
}

struct Swipe: View {
    var body: some View {
        VStack {
            VStack {
                // Top + Bottom 30
                Text("Swipe up to see more")
                    .fontWeight(.heavy)
                    .padding(.vertical, 10)
            }
            HStack {
                Spacer()
                Text("Hello top").fontWeight(.heavy).padding()
            }
            Spacer()
            Text("Hello bottom").fontWeight(.heavy).padding()
        }
        .background(Color.white)
    }
}

//
//  TabbedView.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/11.
//

import SwiftUI

// SwiftUI - TabbedView
// https://www.youtube.com/watch?v=qn5JG-UcQNo&list=PLimqJDzPI-H8nNDU9Xk_hy81vOUAVNGKc&index=3
struct TabbedView: View {
    var body: some View {
        TabView {
            Group {
                Page1().tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home").fontWeight(.light)
                    }
                }
                Page2().tabItem {
                    VStack {
                        Image(systemName: "flame.fill")
                        Text("Page2").fontWeight(.light)
                    }
                }
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color.pink, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
//        .edgesIgnoringSafeArea(.bottom)
//        TabView {
//            Group {
//                Text("Home").tabItem {
//                    Label("Home", systemImage: "house")
//                }
//                Text("Search").tabItem {
//                    Label("Search", systemImage: "house")
//                }
//            }
//            .toolbar(.visible, for: .tabBar)
//            .toolbarBackground(Color.yellow, for: .tabBar)
//            .toolbarBackground(.visible, for: .tabBar)
//        }
    }
}

struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}

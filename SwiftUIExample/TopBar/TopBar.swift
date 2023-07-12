//
//  TopBar.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/12.
//

import SwiftUI

// TopBar
// https://www.youtube.com/watch?v=pjeuNnRp9Sg&list=PLimqJDzPI-H8nNDU9Xk_hy81vOUAVNGKc&index=4
struct TopBar: View {
    @State var currentTab = 0
    var body: some View {
        GeometryReader { geo in
            VStack {
                Picker(selection: $currentTab, label: Text("")) {
                    Image(systemName: "house.fill").tag(0)
                    Image(systemName: "flame.fill").tag(1)
                    Image(systemName: "paperplane.fill").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                if currentTab == 0 {
                    Grid()
                }
                if currentTab == 1 {
                    Page2()
                }
            }
            .frame(height: geo.size.height, alignment: .topLeading)
        }
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}

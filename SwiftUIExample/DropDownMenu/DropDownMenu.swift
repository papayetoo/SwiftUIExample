//
//  DropDownMenu.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/17.
//

import SwiftUI

// Drop down menu in Swift UI
// https://www.youtube.com/watch?v=CwD4cScGCq8&list=PLimqJDzPI-H8nNDU9Xk_hy81vOUAVNGKc&index=15

struct DropDownMenu: View {
    var body: some View {
        DropDown {
            Button(action: {
                print("Hello from papayetoo!!")
            }) {
                Text("Hello")
            }
            Text("Hello")
            Text("Ni Hao")
            Text("Hi")
        }
    }
}

struct DropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropDownMenu()
    }
}

struct DropDown<Content: View>: View {
    @State var expand = false
    @ViewBuilder var content: () -> Content
    var title: String { expand ? "Fold" : "Expand" }
    var imageName: String { expand ? "chevron.up" : "chevron.down" }
    var body: some View {
        VStack {
            HStack {
                Text(title).fontWeight(.heavy)
                
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 10, height: 10)
            }.onTapGesture {
                expand.toggle()
            }
            
            if expand {
                content()
            }
        }
        .padding(7)
        .background(LinearGradient(gradient: .init(colors: [.red, .orange]), startPoint: .top, endPoint: .bottom))
        .frame(height: expand ? 500 : 100)
        .cornerRadius(20)
    }
}

//
//  ContextMenu.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/12.
//

import SwiftUI

// ContextMenu in SwiftUI
// https://www.youtube.com/watch?v=NgXHemwSFIQ&list=PLimqJDzPI-H8nNDU9Xk_hy81vOUAVNGKc&index=6
struct ContextMenu: View {
    var body: some View {
        Image("img1").resizable().frame(height: 300)
            .cornerRadius(20)
            .padding()
            .contextMenu {
                VStack {
                    Button(action: {
                        print("save")
                    }, label: {
                        HStack {
                            Image(systemName: "folder.fill")
                            Text("Save to Gallery")
                        }
                    })
                    Button(action: {
                        print("send")
                    }, label: {
                        HStack {
                            Image(systemName: "paperplane.fill")
                            Text("Send")
                        }
                    })
                }
            }
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu()
    }
}

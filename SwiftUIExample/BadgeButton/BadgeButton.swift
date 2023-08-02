//
//  BadgeButton.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/17.
//

import SwiftUI

// Button with badge in SwiftUI
// https://www.youtube.com/watch?v=TZrV1U7pMok&list=PLimqJDzPI-H8nNDU9Xk_hy81vOUAVNGKc&index=14
struct BadgeButton: View {
    var body: some View {
        CustomButton {
            print("Tapped")
        }
    }
}

struct BadgeButton_Previews: PreviewProvider {
    static var previews: some View {
        BadgeButton()
    }
}

struct CustomButton: View {
    @State var count: Int = 10
    var block: () -> Void
    var body: some View {
        
        ZStack {
            Button(action: {
                block()
                count = max(count - 1, 0)
            }) {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            .padding()
            .background(Color.mint)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            
            if count > 0 {
                Text("\(count)").padding(6)
                    .background(Color.black)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    .offset(CGSize(width: 20, height: -25))
            }
        }
        .animation(.spring(), value: 10)
    }
}

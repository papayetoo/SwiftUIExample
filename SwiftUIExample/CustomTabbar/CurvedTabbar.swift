//
//  CurvedTabbar.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/16.
//

import SwiftUI

// Custom Tab bar in SwiftUI
// https://www.youtube.com/watch?v=m0l-nxznbiw&list=PLimqJDzPI-H8nNDU9Xk_hy81vOUAVNGKc&index=10
struct CurvedTabbar: View {
    @State var selectedItem: Int = 0
    var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .top) {
                BottomBar(selectedItem: $selectedItem)
                    .padding()
                    .padding(.horizontal, 22)
                    .background(CurvedShape())
                
                Button(action: {
                    
                }) {
                    Image(systemName: "paperplane.fill")
                        .padding(10)
                }
                .background(Color.yellow)
                .clipShape(Circle())
                .offset(y: -30)
            }
        }
        .background(Color.white)
    }
}

struct CurvedTabbar_Previews: PreviewProvider {
    static var previews: some View {
        CurvedTabbar()
    }
}

struct CurvedShape: View {
    var body: some View {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 60))
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width / 2, y: 60), radius: 32, startAngle: .zero, endAngle: Angle(degrees: 180), clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: 60))
        }
        .fill(Color.gray)
        .rotationEffect(Angle(degrees: 180))
    }
}


struct BottomBar: View {
    @Binding var selectedItem: Int
    var body: some View {
        HStack {
            Button(action: {
                self.selectedItem = 0
            }) {
                Image(systemName: "flame.fill")
            }
            .foregroundColor(selectedItem == 0 ? .white : .indigo)
            Spacer(minLength: 12)
            Button(action: {
                self.selectedItem = 1
            }) {
                Image(systemName: "house.fill")
            }
            .foregroundColor(selectedItem == 1 ? .white : .indigo)
            Spacer(minLength: 12)
            Button(action: {
                self.selectedItem = 2
            }) {
                Image(systemName: "house.fill")
            }
            .foregroundColor(selectedItem == 2 ? .white : .indigo)
            Spacer(minLength: 12)
            Button(action: {
                self.selectedItem = 3
            }) {
                Image(systemName: "house.fill")
            }
            .foregroundColor(selectedItem == 3 ? .white : .indigo)
        }
    }
}

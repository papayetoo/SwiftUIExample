//
//  Grid.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/11.
//

import SwiftUI

// Grid View in SwiftUI -
// https://www.youtube.com/watch?v=U_wnXRFmMww&list=PLimqJDzPI-H8nNDU9Xk_hy81vOUAVNGKc&index=1
struct Grid: View {
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(1..<5) { i in
                        HStack {
                            Image("img\(i)").resizable()
                                .frame(width: geo.size.width / 2 - 20)
                                .cornerRadius(15)
                            Image("img\(i)").resizable()
                                .frame(width: geo.size.width / 2 - 20)
                                .cornerRadius(15)
                        }.frame(height: UIDevice.current.orientation.isLandscape ? 300 : 150)
                    }
                }
            }
            .frame(width: geo.size.width)
        }
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}

//
//  ListRow.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/11.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListRow: View {
    var url: String
    var name: String
    var body: some View {
        HStack {
            AnimatedImage(url: URL(string: url))
                .resizable()
                .frame(width: 60, height: 50)
                .clipShape(Circle())
                .shadow(radius: 20)
            Text(name)
                .fontWeight(.heavy)
                .padding(.leading, 10)
        }
    }
}

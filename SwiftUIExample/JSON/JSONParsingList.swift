//
//  JSONParsingList.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/11.
//

import SwiftUI

struct JSONParsingList: View {
    @ObservedObject var getData = Datas()
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                List(getData.jsonData) { i in
                    ListRow(url: i.avatar_url, name: i.login)
                }
                .frame(width: geo.size.width)
                .navigationTitle("Json Parsing")
            }
        }
    }
}

struct JSONParsingList_Previews: PreviewProvider {
    static var previews: some View {
        JSONParsingList()
    }
}

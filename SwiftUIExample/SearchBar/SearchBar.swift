//
//  SearchBar.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/12.
//

import SwiftUI

// Search Bar in SwiftUI
// https://www.youtube.com/watch?v=TOUD5Rm6GS0&list=PLimqJDzPI-H8nNDU9Xk_hy81vOUAVNGKc&index=5
struct SearchBar: View {
    @State var datas = ["hello", "hi", "welcome", "world", "asdasd", "ugugu"]
    @State var text = ""
    var body: some View {
        VStack {
            SearchView(text: $text)
            List(datas.filter { text == "" ? true : $0.localizedCaseInsensitiveContains(text)}, id: \.self) { i in
                Text(i).fontWeight(.heavy)
            }
        }
        .frame(alignment: .topLeading)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}

struct SearchView: UIViewRepresentable {
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        return SearchView.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let searchBar = UISearchBar()
        searchBar.barStyle = .default
        searchBar.autocapitalizationType = .none
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UIViewType,
                      context: Context) {
        
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        var parent: SearchView
        
        init(parent: SearchView) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parent.text = searchText
        }
    }
}

//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MultilineTextfield()
            .environmentObject(observed())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

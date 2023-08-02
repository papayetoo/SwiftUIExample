//
//  CustomAlert.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/17.
//

import SwiftUI

struct CustomAlert: View {
    @State var shown: Bool = false
    var body: some View {
        ZStack {
            NavigationView {
                List(0..<10) { i in
                    Text("hello \(i)").fontWeight(.heavy)
                }
                .navigationTitle("home")
                .toolbar {
                    Button(action: {
                        shown = true
                    }) {
                        Text("open")
                    }
                }
            }.blur(radius: shown ? 10 : 0)
            
            if shown {
                AlertView(shown: $shown)
            }
        }
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert()
    }
}

struct AlertView: View {
    @Binding var shown: Bool
    var text = Text("This is the test")
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.shown.toggle()
                    }) {
                        Image(systemName: "xmark").resizable()
                            .frame(width: 10, height: 10)
                            .padding(10)
                    }
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                
                text
            }
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.yellow)
        }
    }
}

//
//  ActionSheet.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/08/17.
//

import SwiftUI

struct ActionSheet: View {
    
    @State var show = false
    
    var body: some View {
        ZStack {
            Button(action: {
                show.toggle()
            }) {
                Text("Action Sheet")
            }
            
            VStack {
                Spacer()
                _ActionSheet()
                    .offset(y: show ? .zero : UIScreen.main.bounds.height)
            }
            .onTapGesture {
                show.toggle()
            }
            .background(show ? Color.black.opacity(0.3) : Color.clear)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                show.toggle()
            }
        }
        .animation(.easeInOut(duration: 0.3), value: show)
    }
}

struct ActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheet()     
    }
}

private struct _ActionSheet: View {
    @State var show: Bool = false
    @State var show1: Bool = false
    @State var show2: Bool = false
    @State var show3: Bool = false
    @State var show4: Bool = false
    @State var count: Int = 0
    var body: some View {
        VStack(spacing : 15) {
            Toggle(isOn: self.$show) {
                Text("Notification")
            }
            Toggle(isOn: self.$show1) {
                Text("Notification")
            }
            Toggle(isOn: self.$show2) {
                Text("Notification")
            }
            Toggle(isOn: self.$show3) {
                Text("Notification")
            }
            Toggle(isOn: self.$show4) {
                Text("Notification")
            }
            
            Button(action: {
                count += 1
            }) {
                Text("Increse count \(count)")
            }
        }
        .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
        .padding(.horizontal)
        .padding(.top, 20)
        .background(Color.white)
        .cornerRadius(25)
        .edgesIgnoringSafeArea(.bottom)
    }
}

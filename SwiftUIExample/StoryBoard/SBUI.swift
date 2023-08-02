//
//  SBUI.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/16.
//

import SwiftUI

// Using Storyboard in SwiftUI
// https://www.youtube.com/watch?v=AUaRegVfGBk&list=PLimqJDzPI-H8nNDU9Xk_hy81vOUAVNGKc&index=11
struct SBUI: View {
    var body: some View {
        SBController()
            .edgesIgnoringSafeArea(.all)
    }
}

struct SBUI_Previews: PreviewProvider {
    static var previews: some View {
        SBUI()
    }
}

struct SBController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "SB", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "Home")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

//
//  MyView.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/16.
//

import SwiftUI

// UIViewController to SwiftUI Conversion 
struct MyView: View {
    var body: some View {
        MyViewControllerUI()
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}

struct MyViewControllerUI: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let viewController = MyViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, MyViewControllerDelegate {
        func didTouchCenterButton() {
            print("Coordinator didTouch CenterButton")
        }
    }
}

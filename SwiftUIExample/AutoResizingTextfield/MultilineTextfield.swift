//
//  MultilineTextfield.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/20.
//

import SwiftUI

struct MultilineTextfield: View {
    @State var height: CGFloat = 100
    
    var body: some View {
        TF(height: $height)
            .frame(height: height)
            .background(Color.yellow)
    }
}

struct MultilineTextfield_Previews: PreviewProvider {
    static var previews: some View {
        MultilineTextfield()
    }
}

struct TF: UIViewRepresentable {
    
    @Binding var height: CGFloat
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = UITextView()
        view.font = .systemFont(ofSize: 19)
        view.text = "Type something"
        view.textColor = UIColor.black.withAlphaComponent(0.3)
        view.delegate = context.coordinator
        view.backgroundColor = .yellow
        view.bounds.size = CGSize(width: view.bounds.width, height: height)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TF
        
        init(_ parent: TF) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.height = textView.contentSize.height
        }
        
    }
}


class observed: ObservableObject {
    @Published var size: CGFloat = .zero
}

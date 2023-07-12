//
//  ImagePicker.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/12.
//

import SwiftUI
import PhotosUI

// Image Picker in SwiftUI
// https://www.youtube.com/watch?v=npYenGX4nMw&list=PLimqJDzPI-H8nNDU9Xk_hy81vOUAVNGKc&index=7
struct ImagePicker: View {
    @State var imageData = Data(count: 0)
    @State var shown = false
    
    var body: some View {
        VStack {
            if let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .frame(height: 300)
                    .padding()
                    .cornerRadius(30)
            }
            Button(action: {
                self.shown = true
            }) {
                Text("Select Image")
            }
            .sheet(isPresented: $shown, onDismiss: {
                self.shown = false
            }) {
                IPicker(imageData: $imageData, shown: $shown)
            }
        }
    }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker()
    }
}

struct IPicker: UIViewControllerRepresentable {
 
    @Binding var imageData: Data
    @Binding var shown: Bool
    
   
    func makeCoordinator() -> Coordinator {
        Coordinator(imageData: $imageData,
                    shown: $shown)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        controller.sourceType = .photoLibrary
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var imageData: Data
        @Binding var shown: Bool
        
        init(imageData: Binding<Data>, shown: Binding<Bool>) {
            _imageData = imageData
            _shown = shown
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            imageData = image.jpegData(compressionQuality: 80)!
            shown.toggle()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            shown.toggle()
        }
    }
}


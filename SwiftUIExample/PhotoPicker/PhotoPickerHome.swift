//
//  PhotoPickerHome.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/09/06.
//

import SwiftUI
import PhotosUI

struct PhotoPickerHome: View {
    
    @StateObject var photosModel = PhotosPickerModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if !photosModel.loadedImages.isEmpty {
                    TabView {
                        ForEach(photosModel.loadedImages) {
                            $0.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                        }
                    }
                    .tabViewStyle(.page)
                    .frame(height: 250)
                }
            }
            .navigationTitle("Photos Picker")
            .toolbar {
                PhotosPicker(selection: $photosModel.selectedPhotos, matching: .any(of: [.images])) {
                    Image(systemName: "photo.fill")
                        .font(.callout)
                }
            }
        }
    }
}


struct PhotoPickerHome_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerHome()
    }
}

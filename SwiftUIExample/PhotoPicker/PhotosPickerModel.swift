//
//  PhotosPickerModel.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/09/06.
//

import SwiftUI
import PhotosUI

class PhotosPickerModel: ObservableObject {
    
    @Published var loadedImages: [MediaFile] = []
    
    @Published var selectedPhoto: PhotosPickerItem? {
        didSet {
            if let selectedPhoto {
                processPhoto(photo: selectedPhoto)
            }
        }
    }
    
    @Published var selectedPhotos: [PhotosPickerItem] = [] {
        didSet {
            for photo in selectedPhotos {
                processPhoto(photo: photo)
            }
        }
    }
    
    func processPhoto(photo: PhotosPickerItem) {
        // MARK: Extracting image dagta
        photo.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async { [weak self] in
                switch result{
                case .success(let data):
                    if let data, let image = UIImage(data: data) {
                        self?.loadedImages.append(.init(image: Image(uiImage: image), data: data))
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

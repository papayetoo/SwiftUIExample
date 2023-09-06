//
//  MediaFile.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/09/06.
//

import SwiftUI

struct MediaFile: Identifiable {
    var id = UUID().uuidString
    var image: Image
    var data: Data
}

//
//  Album.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/08/29.
//

import Foundation

struct Album: Identifiable {
    var id = UUID().uuidString
    var title: String
    var image: String
    var showDisk: Bool = false
    var diskOffset: Double = .zero
}

//
//  Card.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/08/01.
//

import Foundation

struct Card: Identifiable, Hashable, Equatable {
    var id: UUID = .init()
    var image: String
    var previousOffset: CGFloat = 0
}

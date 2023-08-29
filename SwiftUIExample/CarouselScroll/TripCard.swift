//
//  TripCard.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/08/27.
//

import Foundation

struct TripCard: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var image: String
}

var tripCards: [TripCard] = [
    .init(title: "London", subTitle: "England", image: "img1"),
    .init(title: "NewYork", subTitle: "USA", image: "img2"),
    .init(title: "Prague", subTitle: "Czech", image: "img3"),
]

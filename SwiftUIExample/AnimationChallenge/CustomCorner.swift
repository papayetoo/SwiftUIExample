//
//  CustomCorner.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/08/29.
//

import SwiftUI

struct CustomCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return .init(path.cgPath)
    }
}

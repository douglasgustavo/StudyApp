//
//  RoundedComponent.swift
//  StudyApp
//
//  Created by Douglas Santos on 26/09/21.
//

import SwiftUI

struct RoundedSolid: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedSolid_Previews: PreviewProvider {
    static var previews: some View {
        RoundedSolid()
    }
}

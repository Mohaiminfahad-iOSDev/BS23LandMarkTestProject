//
//  CGFloat+Extensions.swift
//  BSLandmarkTestProject
//
//  Created by mohaimin fahad on 21/6/24.
//

import Foundation

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

//
//  LandMarkListSection.swift
//  BSLandmarkTestProject
//
//  Created by mohaimin fahad on 21/6/24.
//

import Foundation

struct LandMarkListSection<I: Hashable>: Hashable {
    let sectionType: LandMarkListSectionType
    var items: [I]
}

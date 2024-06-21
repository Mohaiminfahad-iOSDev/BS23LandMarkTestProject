//
//  CollectionViewLayoutBuilder.swift
//  BSLandmarkTestProject
//
//  Created by mohaimin fahad on 21/6/24.
//

import Foundation
import UIKit

class CollectionViewLayoutBuilder {
    
    func verticalListLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(10))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(10))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        //section.orthogonalScrollingBehavior = .continuous
        return section
    }
}

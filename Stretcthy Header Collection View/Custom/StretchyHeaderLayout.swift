//
//  StretchyHeaderLayout.swift
//  Stretcthy Header Collection View
//
//  Created by Faridho Luedfi on 05/05/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributs = super.layoutAttributesForElements(in: rect)
        
        layoutAttributs?.forEach({ (attributs) in
            
            if attributs.representedElementKind == UICollectionView.elementKindSectionHeader && attributs.indexPath.section == 0 {
                
                guard let collectionView = collectionView else { return }
                
                let contentOffsetY = collectionView.contentOffset.y
                
                if contentOffsetY > 0 { return }
                
                let width = collectionView.frame.width
                let height = attributs.frame.height - contentOffsetY
                
                
                // Header
                attributs.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
                
            }
            
        })
        
        return layoutAttributs
        
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}

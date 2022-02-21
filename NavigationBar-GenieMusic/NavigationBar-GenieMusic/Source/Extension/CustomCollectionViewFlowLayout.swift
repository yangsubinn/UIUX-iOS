//
//  CustomCollectionViewFlowLayout.swift
//  NavigationBar-GenieMusic
//
//  Created by 양수빈 on 2022/02/21.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
//    override var sectionHeadersPinToVisibleBounds: Bool = true
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        guard let offset = collectionView?.contentOffset, let stLayoutAttributes = layoutAttributes else { return layoutAttributes }
        
        print("🚨 \(offset.y)")
        
        if offset.y <= 0 {
            for attributes in stLayoutAttributes {
                if let elmKind = attributes.representedElementKind, elmKind == UICollectionView.elementKindSectionHeader {
                    let diffValue = abs(offset.y)
                    var frame = attributes.frame
//                    frame.size.height = max(0, headerReferenceSize.height + diffValue)
                    frame.size.height = 240 //max(140, 140 + diffValue)
                    frame.origin.y = frame.minY - diffValue
                    attributes.frame = frame
                }
            }
        } else {
            for attributes in stLayoutAttributes {
                if let elmKind = attributes.representedElementKind, elmKind == UICollectionView.elementKindSectionHeader {
                    let diffValue = abs(offset.y)
                    var frame = attributes.frame
                    frame.size.height = max(120, 240 - diffValue)
                    frame.origin.y = max((frame.minY - diffValue), -40)
//                    frame.origin.y = frame.minY - diffValue
                    attributes.frame = frame
                    
                    print("🎧 \(frame.size.height), \(frame.origin.y)")
                    
//                    if frame.size.height == 120 {
//                        sectionHeadersPinToVisibleBounds = true
//                    } else {
//                        sectionHeadersPinToVisibleBounds = false
//                    }
                    
                    attributes.alpha = 1 - diffValue/480
                }
            }
        }
        return layoutAttributes
    }
}

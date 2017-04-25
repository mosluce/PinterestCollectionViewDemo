//
//  PinterestCollectionViewLayout.swift
//  PinterestDemo
//
//  Created by 默司 on 2017/4/25.
//  Copyright © 2017年 默司. All rights reserved.
//

import UIKit

class PinterestCollectionViewLayout: UICollectionViewLayout {
    
    weak var delegate: PinterestCollectionViewLayoutDelegate!
    
    var cacheAttrs: [UICollectionViewLayoutAttributes]!
    var contentHeight: CGFloat = 0
    var columnHeights: [CGFloat]!
    
    override var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else {
            return CGSize.zero
        }
        
        let w = UIScreen.main.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right
        
        return CGSize(width: w, height: contentHeight)
    }
    
    override func prepare() {
        guard let collectionView = collectionView else {
            return
        }
        
        self.columnHeights = [0, 0]
        self.cacheAttrs = []
        
        for i in 0..<collectionView.numberOfItems(inSection: 0) {
            if let attr = layoutAttributesForItem(at: IndexPath(item: i, section: 0)) {
                cacheAttrs.append(attr)
            }
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttrs
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        //水平間格
        let hs = self.delegate.horizontalSpace()
        //垂直間格
        let vs = self.delegate.verticalSpace()
        //寬
        let w = (collectionViewContentSize.width - hs) / 2
        // 垂直位置
        let y = columnHeights.min() ?? 0
        // 索引
        let i = columnHeights.index(of: y) ?? 0
        // 水平位置
        let x = CGFloat(i) * (w + hs)
        // 高
        let h: CGFloat = self.delegate.cellHeight(at: indexPath, width: w)
        
        self.columnHeights[i] = y + h + vs
        
        attr.frame = CGRect(x: x, y: y, width: w, height: h)
        
        self.contentHeight = columnHeights.max() ?? 0
        
        return attr
    }
}

protocol PinterestCollectionViewLayoutDelegate: class {
    func verticalSpace() -> CGFloat
    func horizontalSpace() -> CGFloat
    func cellHeight(at indexPath: IndexPath, width: CGFloat) -> CGFloat
}

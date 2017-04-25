//
//  PinterestCell.swift
//  PinterestDemo
//
//  Created by 默司 on 2017/4/25.
//  Copyright © 2017年 默司. All rights reserved.
//

import UIKit

class PinterestCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var data: PinterestData! {
        didSet {
            imageView.image = data.image
            label.text = data.text
            label.sizeToFit()
            layoutIfNeeded()
        }
    }
    
    var caculatedHeight: CGFloat {
        return containerView.frame.height
    }
    
    override func prepareForReuse() {
        self.imageView.image = nil
        self.imageView.contentMode = .scaleAspectFill
        self.label.numberOfLines = 0
        self.label.text = nil
    }
}

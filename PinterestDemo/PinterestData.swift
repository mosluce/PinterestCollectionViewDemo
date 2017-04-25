//
//  PinterestData.swift
//  PinterestDemo
//
//  Created by 默司 on 2017/4/25.
//  Copyright © 2017年 默司. All rights reserved.
//

import UIKit

protocol PinterestData {
    var image: UIImage? { get set }
    var text: String? { get set }
}

class PinterestDataItem: PinterestData {
    var image: UIImage? = nil
    var text: String? = nil
    
    init(image: UIImage?, text: String?) {
        self.image = image
        self.text = text
    }
}

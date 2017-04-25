//
//  Animal.swift
//  PinterestDemo
//
//  Created by 默司 on 2017/4/25.
//  Copyright © 2017年 默司. All rights reserved.
//

import UIKit

class Animal: NSObject {
    var album_file: String?
    var animal_kind: String?
    var shelter_name: String?
    var animal_remark: String?
    
    convenience init(json: [String: Any]) {
        self.init()
        
        album_file = json["album_file"] as? String
        animal_kind = json["animal_kind"] as? String
        shelter_name = json["shelter_name"] as? String
        animal_remark = json["animal_remark"] as? String
    }
}

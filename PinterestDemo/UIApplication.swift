//
//  UIApplication.swift
//  PinterestDemo
//
//  Created by 默司 on 2017/4/25.
//  Copyright © 2017年 默司. All rights reserved.
//

import UIKit

extension UIApplication {
    var topViewController: UIViewController? {
        guard var topViewController = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        return topViewController
    }
    
//    var topNavigationController: UINavigationController? {
//        return topViewController as? UINavigationController
//    }
}

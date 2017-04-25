//
//  ViewController.swift
//  PinterestDemo
//
//  Created by 默司 on 2017/4/25.
//  Copyright © 2017年 默司. All rights reserved.
//

import UIKit

class ViewController: PinterestCollectionViewController {
    
    var animals: [Animal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 0. 設定
        self.collectionView?.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)
        
        // 1. 下載資料
        AnimalOpenData.shared.get { (result) in
            switch result {
            case .ok(let animals):
                // 2. 顯示資料
                let totalCount = animals.count
                
                self.animals = Array(animals[0...min(499, totalCount - 1)])
                self.reloadData()
            case .fail(let error):
                error.present()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animals.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, dataForItemAt indexPath: IndexPath) -> PinterestData {
        return PinterestDataItem(image: nil, text: "\(indexPath.item + 1). \(animals[indexPath.item].shelter_name ?? "無名稱")")
    }
    
    override func cellHeight(at indexPath: IndexPath, width: CGFloat) -> CGFloat {
        let data = animals[indexPath.item]
        
        guard let text = data.shelter_name else { return width }
        
        let rect = ("\(indexPath.row + 1). \(text)" as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin,
                                        attributes:[
                                            NSFontAttributeName: UIFont.systemFont(ofSize: 16)
                                            
            ], context: nil)
        
        return width + rect.height + 8
    }

    func reloadData() {
        self.collectionView?.reloadData()
    }
}

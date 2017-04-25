//
//  PinterestCollectionViewController.swift
//  PinterestDemo
//
//  Created by 默司 on 2017/4/25.
//  Copyright © 2017年 默司. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PinterestCell"

class PinterestCollectionViewController: UICollectionViewController {

    convenience init() {
        let layout = PinterestCollectionViewLayout()
        self.init(collectionViewLayout: layout)
        
        layout.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView?.register(UINib(nibName: "PinterestCell", bundle: Bundle(for: PinterestCell.self)), forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        self.collectionView?.contentInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: PinterestCollectionViewController
    func collectionView(_ collectionView: UICollectionView, dataForItemAt indexPath: IndexPath) -> PinterestData {
        fatalError("should be implement")
    }
    
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PinterestCell
    
        cell.data = self.collectionView(collectionView, dataForItemAt: indexPath)
        cell.layer.cornerRadius = 5
    
        return cell
    }

    // MARK: UICollectionViewDelegate

}


extension PinterestCollectionViewController: PinterestCollectionViewLayoutDelegate {
    func verticalSpace() -> CGFloat {
        return 4
    }
    
    func horizontalSpace() -> CGFloat {
        return 4
    }
    
    func cellHeight(at indexPath: IndexPath, width: CGFloat) -> CGFloat {
        return 200
    }
}

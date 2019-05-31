//
//  StretchyHeaderVC.swift
//  Stretcthy Header Collection View
//
//  Created by Faridho Luedfi on 01/05/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class StretchyHeaderVC: UICollectionViewController {
    
    fileprivate let cellId = "cellId"
    fileprivate let headerId = "headerId"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        setUpCollectionView()
        
        setUpCollectionViewLayout()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setUpCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    fileprivate func setUpCollectionViewLayout() {

        let layout = StretchyHeaderLayout()
        
        layout.headerReferenceSize = .init(width: view.frame.width, height: 400)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.itemSize = CGSize(width: (view.bounds.width - layout.sectionInset.left - layout.sectionInset.right), height: 50)
        
        collectionView!.collectionViewLayout = layout
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY = scrollView.contentOffset.y
        if contentOffsetY < 0 {
            headerView?.animator.fractionComplete = abs(contentOffsetY) / 100
        }
    }
    
    var headerView: HeaderView?
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as? HeaderView
        return headerView!

    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 14
        
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .lightGray
        
        return cell
        
    }
    
    
    
}

//
//  SponsoredListCollectionViewCell.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import UIKit

class SponsoredListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
//    var adapter: SponsoredCollectionViewAdapter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        
//        collectionView.dataSource = adapter
//        collectionView.delegate = adapter
        
        let nib = UINib(nibName: "ProductsListSponsoredCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ProductsListSponsoredCollectionViewCell")
    }
    
    func configure(adapter: SponsoredCollectionViewAdapter) {
//        self.adapter = adapter
        
        collectionView.dataSource = adapter
        collectionView.delegate = adapter
        collectionView.reloadData()
    }

}

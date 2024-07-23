//
//  ProductDetailCollectionViewAdapter.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import UIKit

final class ProductDetailCollectionViewAdapter: NSObject {
    private let presenter: ProductDetailPresenterProtocol
    
    init(presenter: ProductDetailPresenterProtocol) {
        self.presenter = presenter
    }
}

extension ProductDetailCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.imagesItemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProdcutDetailImageSliderCollectionCell", for: indexPath) as! ProdcutDetailImageSliderCollectionCell
        if let item = presenter.imagesItem(at: indexPath) {
            cell.configure(url: item)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width,
               height: collectionView.frame.size.height)
    }
    
    
}

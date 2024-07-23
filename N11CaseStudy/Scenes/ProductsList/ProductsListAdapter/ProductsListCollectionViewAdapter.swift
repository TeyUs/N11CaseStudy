//
//  ProductsListCollectionViewAdapter.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 20.07.2024.
//

import UIKit

final class ProductsListCollectionViewAdapter: NSObject {
    private let presenter: ProductsListAdapterToPresenterProtocol
    
    init(presenter: ProductsListAdapterToPresenterProtocol) {
        self.presenter = presenter
    }
}

extension ProductsListCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.productListItemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SponsoredListCollectionViewCell", for: indexPath) as! SponsoredListCollectionViewCell
            cell.configure(adapter: presenter.getSponsoredAdapter())
            return cell
        } else if let item = presenter.productListItem(at: indexPath){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
            cell.configure(product: item)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.productListSelectedItem(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: collectionView.frame.size.width,
                          height: collectionView.frame.size.height/3.2)
        }
        return CGSize(width: collectionView.frame.size.width / 2,
               height: 290.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        presenter.productListScrolled(at: indexPath)
    }
}

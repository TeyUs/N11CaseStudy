//
//  ProductsListCollectionViewAdapter.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 20.07.2024.
//

import UIKit

final class ProductsListCollectionViewAdapter: NSObject {
    private let presenter: ProductsListPresenterProtocol
    
    var sponsoredAdapter: SponsoredCollectionViewAdapter
    
    init(presenter: ProductsListPresenterProtocol, sponsoredAdapter: SponsoredCollectionViewAdapter) {
        self.presenter = presenter
        self.sponsoredAdapter = sponsoredAdapter
    }
}

extension ProductsListCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.productListItemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SponsoredListCollectionViewCell", for: indexPath) as! SponsoredListCollectionViewCell
            cell.configure(adapter: sponsoredAdapter)
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
                   height: collectionView.frame.size.height/5)
        }
        return CGSize(width: collectionView.frame.size.width / 2,
               height: 290.0)
    }
    
    
}
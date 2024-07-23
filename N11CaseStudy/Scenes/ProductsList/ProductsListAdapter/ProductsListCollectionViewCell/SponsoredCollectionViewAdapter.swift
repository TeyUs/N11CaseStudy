//
//  SponsoredCollectionViewAdapter.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import UIKit

final class SponsoredCollectionViewAdapter: NSObject {
    private let presenter: ProductsListPresenterProtocol
    
    init(presenter: ProductsListPresenterProtocol) {
        self.presenter = presenter
    }
}

extension SponsoredCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.sponsoredProductsItemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsListSponsoredCollectionViewCell", for: indexPath) as! ProductsListSponsoredCollectionViewCell
        if let item = presenter.sponsoredProductsItem(at: indexPath){
            cell.configure(product: item)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.sponsoredProductsSelectedItem(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width,
               height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    
}

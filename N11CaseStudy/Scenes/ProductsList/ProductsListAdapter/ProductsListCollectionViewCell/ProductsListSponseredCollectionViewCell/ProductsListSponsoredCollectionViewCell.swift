//
//  ProductsListSponsoredCollectionViewCell.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import UIKit
import Kingfisher

class ProductsListSponsoredCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var ratioView: UserRateView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceView: DiscountView!
    
    func configure(product: Product) {
        titleLabel.text = product.title
        if let imageStr = product.image,
           let imageUrl = URL(string: imageStr) {
            productImage.kf.setImage(with: imageUrl)
        }
        ratioView.configure(rate: product.rate ?? 0)
        priceView.configure(normal: product.price ?? 0, discounted: product.instantDiscountPrice ?? 0)
    }
}

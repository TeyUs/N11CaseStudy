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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceView: DiscountView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(product: Product) {
        titleLabel.text = product.title
        if let imageStr = product.image,
           let imageUrl = URL(string: imageStr) {
            productImage.kf.setImage(with: imageUrl)
        }
        
        priceView.configure(normal: product.price ?? 0, discounted: product.instantDiscountPrice ?? 0)
    }
}

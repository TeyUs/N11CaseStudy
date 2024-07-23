//
//  ProductCollectionViewCell.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 21.07.2024.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceView: DiscountView!
    
    var product: Product?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(product: Product) {
        nameLabel.text = product.title
        if let imageStr = product.image,
           let imageUrl = URL(string: imageStr) {
            productImage.kf.setImage(with: imageUrl)
        }
        priceView.configure(normal: product.price ?? 0, discounted: product.instantDiscountPrice ?? 0)
    }
}

//
//  ProdcutDetailImageSliderCollectionCell.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import UIKit
import Kingfisher

class ProdcutDetailImageSliderCollectionCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(url: URL) {
        DispatchQueue.main.async { [weak self] in
            self?.productImage.kf.setImage(with: url)
        }
    }

}

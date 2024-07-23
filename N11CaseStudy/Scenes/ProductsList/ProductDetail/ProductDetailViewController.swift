//
//  ProductDetailViewController.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import UIKit
import Kingfisher

final class ProductDetailViewController: UIViewController, StoryboardLoadable {

    @IBOutlet weak var imageSliderCollectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var priceView: DiscountView!
    
    
    var presenter: ProductDetailPresenterProtocol?
    var adapter: ProductDetailCollectionViewAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageSliderCollectionView.dataSource = adapter
        imageSliderCollectionView.delegate = adapter
        let nib1 = UINib(nibName: "ProdcutDetailImageSliderCollectionCell", bundle: nil)
        imageSliderCollectionView.register(nib1, forCellWithReuseIdentifier: "ProdcutDetailImageSliderCollectionCell")
        
        presenter?.viewDidLoad()
    }
    
}


extension ProductDetailViewController: ProductDetailViewProtocol {
    func setPrices(normal: Double, discounted: Double) {
        DispatchQueue.main.async { [weak self] in
            self?.priceView.configure(normal: normal, discounted: discounted, size: .large)
        }
    }
    
    func setTitle(_ text: String?) {
        DispatchQueue.main.async { [weak self] in
            self?.imageSliderCollectionView.reloadData()
            self?.nameLabel.text = text
        }
    }
    
    func setDescription(_ text: String?) {
        DispatchQueue.main.async { [weak self] in
            self?.descriptionLabel.text = text
        }
    }
    
    func setSeller(_ text: String?) {
        DispatchQueue.main.async { [weak self] in
            self?.sellerLabel.text = text
        }
    }
}

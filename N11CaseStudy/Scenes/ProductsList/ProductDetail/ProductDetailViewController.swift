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
    @IBOutlet weak var rateView: UserRateView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var priceView: DiscountView!
    @IBOutlet weak var pageController: UIPageControl!
    
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
    
    @IBAction func pageControlChanged(_ sender: UIPageControl) {
        let current = sender.currentPage
        let indexPath = IndexPath(item: current, section: 0)
        imageSliderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension ProductDetailViewController: ProductDetailViewProtocol {
    func reloadImageSlider() {
        DispatchQueue.main.async { [weak self] in
            self?.imageSliderCollectionView.reloadData()
        }
    }
    
    func setTitle(_ text: String?) {
        DispatchQueue.main.async { [weak self] in
            self?.nameLabel.text = text
        }
    }
    
    func setPageControllerNumberOfPages(_ total: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.pageController.numberOfPages = total
        }
    }
    
    func setPageController(_ currentPage: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.pageController.currentPage = currentPage
        }
    }
    
    func setRateView(_ rate: Double) {
        DispatchQueue.main.async { [weak self] in
            self?.rateView.configure(rate: rate, textSize: .large)
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
    
    func setPrices(normal: Double, discounted: Double) {
        DispatchQueue.main.async { [weak self] in
            self?.priceView.configure(normal: normal, discounted: discounted, size: .large)
        }
    }
}

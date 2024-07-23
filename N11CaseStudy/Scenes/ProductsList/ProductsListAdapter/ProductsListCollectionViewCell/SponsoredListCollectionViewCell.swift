//
//  SponsoredListCollectionViewCell.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import UIKit

class SponsoredListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: "ProductsListSponsoredCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ProductsListSponsoredCollectionViewCell")
    }
    
    func configure(adapter: SponsoredCollectionViewAdapter?) {
        adapter?.pageControllerDelegate = self
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.dataSource = adapter
            self?.collectionView.delegate = adapter
            self?.collectionView.reloadData()
            self?.pageController.numberOfPages = adapter?.pageNumber ?? 0
        }
    }
    
    @IBAction func pageControlTapped(_ sender: UIPageControl) {
        let current = sender.currentPage
        let indexPath = IndexPath(item: current, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension SponsoredListCollectionViewCell: SponsoredPageControllerDelegate {
    func setPageController(_ currentPage: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.pageController.currentPage = currentPage
        }
    }
}

protocol SponsoredPageControllerDelegate {
    func setPageController(_ currentPage: Int)
}

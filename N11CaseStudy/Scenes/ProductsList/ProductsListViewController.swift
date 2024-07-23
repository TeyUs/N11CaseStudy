//
//  ProductsListViewController.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 20.07.2024.
//

import UIKit

final class ProductsListViewController: UIViewController, StoryboardLoadable {
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    var presenter: ProductsListPresenterProtocol?
    var adapter: ProductsListCollectionViewAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        title = "N11 Ürünler"
        
        productsCollectionView.dataSource = adapter
        productsCollectionView.delegate = adapter
        
        let nib1 = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        productsCollectionView.register(nib1, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
        let nib2 = UINib(nibName: "SponsoredListCollectionViewCell", bundle: nil)
        productsCollectionView.register(nib2, forCellWithReuseIdentifier: "SponsoredListCollectionViewCell")
        
//        presenter?.viewDidLoad()
    }
    
    func setSponseredPageControl(to currentPage: Int) {
        productsCollectionView.reloadItems(at: [IndexPath(row: 0, section: 0)])
    }
}

extension ProductsListViewController: ProductsListViewProtocol {
    func reloadView() {
        DispatchQueue.main.async { [weak self] in
            self?.productsCollectionView.reloadData()
        }
    }
}

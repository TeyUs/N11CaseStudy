//
//  ProductsListRouter.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 20.07.2024.
//

import UIKit

final class ProductsListRouter {
    
    // MARK: Properties
    weak var view: UIViewController?
    var sponsoredAdapter: SponsoredCollectionViewAdapter?
    
    // MARK: Static methods
    static func setupModule() -> ProductsListViewController {
        let viewController = UIStoryboard.loadViewController() as ProductsListViewController
        let formatter = ProductListFormatter()
        let presenter = ProductsListPresenter()
        let router = ProductsListRouter()
        let interactor = ProductsListInteractor()
        let sponsoredAdapter = SponsoredCollectionViewAdapter(presenter: presenter)
        let adapter = ProductsListCollectionViewAdapter(presenter: presenter)
        
        viewController.adapter = adapter
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        presenter.formatter = formatter
        
        router.sponsoredAdapter = sponsoredAdapter
        router.view = viewController
        
        interactor.output = presenter
        interactor.formatter = formatter
        interactor.networkManager = NetworkManager.shared
        
        return viewController
    }
}

extension ProductsListRouter: ProductsListRouterProtocol {
    func getSponsoredAdapter() -> SponsoredCollectionViewAdapter? {
        sponsoredAdapter
    }
    
    func navigateToDetail(_ id: Int) {
        print(id)
        let viewController = ProductDetailRouter.setupModule(id: id)
        view?.show(viewController, sender: nil)
    }
    
}

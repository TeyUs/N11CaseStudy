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
    
    // MARK: Static methods
    static func setupModule() -> ProductsListViewController {
        let viewController = UIStoryboard.loadViewController() as ProductsListViewController
        let presenter = ProductsListPresenter()
        let router = ProductsListRouter()
        let interactor = ProductsListInteractor()
        let sponsoredAdapter = SponsoredCollectionViewAdapter(presenter: presenter)
        let adapter = ProductsListCollectionViewAdapter(presenter: presenter, sponsoredAdapter: sponsoredAdapter)
        
        viewController.adapter = adapter
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

extension ProductsListRouter: ProductsListRouterProtocol {
    func navigateToDetail(_ id: Int) {
        print(id)
        let viewController = ProductDetailRouter.setupModule(id: id)
        view?.show(viewController, sender: nil)
    }
    
}
//
//  ProductDetailRouter.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import UIKit

final class ProductDetailRouter {
    
    // MARK: Properties
    weak var view: UIViewController?
    
    // MARK: Static methods
    static func setupModule(id: Int) -> ProductDetailViewController {
        let viewController = UIStoryboard.loadViewController() as ProductDetailViewController
        let presenter = ProductDetailPresenter(id: id)
        let router = ProductDetailRouter()
        let interactor = ProductDetailInteractor()
        let adapter = ProductDetailCollectionViewAdapter(presenter: presenter)
        
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

extension ProductDetailRouter: ProductDetailRouterProtocol {}



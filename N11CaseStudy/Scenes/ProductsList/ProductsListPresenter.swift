//
//  ProductsListPresenter.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 20.07.2024.
//

import Foundation

final class ProductsListPresenter {
    weak var view: ProductsListViewProtocol?
    var router: ProductsListRouterProtocol?
    var interactor: ProductsListInteractorProtocol?
    
    var page: Int = 1
}

extension ProductsListPresenter: ProductsListPresenterProtocol {
    
    func viewDidLoad() {
        interactor?.retriveProducts(page: page)
    }
    
    var productListItemsCount: Int {
        (interactor?.getProductsListResponse()?.products?.count ?? 0) + 1
    }
    
    func productListItem(at index: IndexPath) -> Product? {
        if index.row == 0 {
            return nil
        } else {
            return interactor?.getProductsListResponse()?.products?[index.row - 1]
        }
    }
    
    func productListSelectedItem(at index: IndexPath) {
        guard let id = productListItem(at: index)?.id else {
            errorOccurred(error: "index id")
            return
        }
        router?.navigateToDetail(id)
    }

    var sponsoredProductsItemsCount: Int {
        interactor?.getProductsListResponse()?.sponsoredProducts?.count ?? 0
    }
    
    func sponsoredProductsItem(at index: IndexPath) -> Product? {
        interactor?.getProductsListResponse()?.sponsoredProducts?[index.row]
    }
    
    func sponsoredProductsSelectedItem(at index: IndexPath) {
        guard let id = sponsoredProductsItem(at: index)?.id else {
            errorOccurred(error: "index id")
            return
        }
        router?.navigateToDetail(id)
    }
    
}

extension ProductsListPresenter: ProductsListInteractorToPresenterProtocol {
    func productsListResponseRetrived() {
        view?.reloadView()
    }
    
    func errorOccurred(error: String) {
        
    }
}

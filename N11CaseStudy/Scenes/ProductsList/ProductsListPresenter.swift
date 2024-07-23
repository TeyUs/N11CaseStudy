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
    var formatter: ProductListFormatterProtocol?
    
    var isNetworkWorking = false
}

extension ProductsListPresenter: ProductsListPresenterProtocol {
    func viewDidLoad() {
        if let nextPage = formatter?.nextPage, !isNetworkWorking {
            isNetworkWorking = true
            interactor?.retriveProducts(page: nextPage)
        }
    }
    
    var productListItemsCount: Int {
        (formatter?.getNormalProductsItemsCount ?? 0) + 1
    }
    
    func productListItem(at index: IndexPath) -> Product? {
        if index.row == 0 {
            return nil
        } else {
            return formatter?.getNormalProductsItem(at: index.row - 1)
        }
    }
    
    func productListSelectedItem(at index: IndexPath) {
        guard let id = productListItem(at: index)?.id else {
            errorOccurred(error: "index id")
            return
        }
        router?.navigateToDetail(id)
    }
    
    func loadNextPage() {
        
    }
    
    func productListScrolled(at index: IndexPath) {
        if let nextPage = formatter?.nextPage,
           index.row > productListItemsCount - 3,
           !isNetworkWorking {
            isNetworkWorking = true
            interactor?.retriveProducts(page: nextPage)
        }
    }
    
    

    var sponsoredProductsItemsCount: Int {
        formatter?.getSponsoredProductsItemsCount ?? 0
    }
    
    func sponsoredProductsItem(at index: IndexPath) -> Product? {
        formatter?.getSponsoredProductsItem(at: index.row)
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
    func productsListResponsesRetrived() {
        isNetworkWorking = false
        view?.reloadView()
    }
    
    func errorOccurred(error: String) {
        isNetworkWorking = false
        
    }
}

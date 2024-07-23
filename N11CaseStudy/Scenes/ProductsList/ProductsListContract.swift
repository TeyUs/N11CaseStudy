//
//  ProductsListContract.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 20.07.2024.
//

import Foundation

//presenter'da, view'ı yönetecek
protocol ProductsListViewProtocol: AnyObject {
    func reloadView()
}

//view'daki ve adapter'deki presenter
protocol ProductsListPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol ProductsListAdapterToPresenterProtocol: AnyObject {
    var productListItemsCount: Int { get }
    func productListItem(at index: IndexPath) -> Product?
    func productListSelectedItem(at index: IndexPath)
    func productListScrolled(at index: IndexPath)
    func getSponsoredAdapter() -> SponsoredCollectionViewAdapter?
}

protocol SponsoredListAdapterToPresenterProtocol: AnyObject {
    var sponsoredProductsItemsCount: Int { get }
    func sponsoredProductsItem(at index: IndexPath) -> Product?
    func sponsoredProductsSelectedItem(at index: IndexPath)
}

//presenter'daki interactor
protocol ProductsListInteractorProtocol: AnyObject {
    func retriveProducts(page: Int)
}

//interactor'daki presenter
protocol ProductsListInteractorToPresenterProtocol: AnyObject {
    func productsListResponsesRetrived()
    func errorOccurred(error: String)
}

//presenter'da
protocol ProductsListRouterProtocol: AnyObject {
    func navigateToDetail(_ id: Int)
    func getSponsoredAdapter() -> SponsoredCollectionViewAdapter?
}

protocol ProductListFormatterProtocol: AnyObject {
    var nextPage: Int? { get }
    func parseResponse(_ response: ProductsReponse)
    var getNormalProductsItemsCount: Int { get }
    func getNormalProductsItem(at index: Int) -> Product
    var getSponsoredProductsItemsCount: Int { get }
    func getSponsoredProductsItem(at index: Int) -> Product
}

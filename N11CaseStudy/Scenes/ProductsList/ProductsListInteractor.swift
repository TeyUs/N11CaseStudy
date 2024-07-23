//
//  ProductsListInteractor.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 20.07.2024.
//

import Foundation

final class ProductsListInteractor {
    
    weak var output: ProductsListInteractorToPresenterProtocol?
    private var productsListResponse: ProductsReponse?
}

extension ProductsListInteractor: ProductsListInteractorProtocol {
    func retriveProducts(page: Int) {
        Task {
            do {
                let response: ProductsReponse = try await NetworkManager.shared.get(endpoint: .productList(page: page))
                self.productsListResponse = response
                output?.productsListResponseRetrived()
            } catch {
                output?.errorOccurred(error: "")
            }
        }
    }
    
    func getProductsListResponse() -> ProductsReponse? {
        productsListResponse
    }
}

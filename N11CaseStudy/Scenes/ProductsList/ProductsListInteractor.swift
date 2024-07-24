//
//  ProductsListInteractor.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 20.07.2024.
//

import Foundation

final class ProductsListInteractor {
    weak var output: ProductsListInteractorToPresenterProtocol?
    var formatter: ProductListFormatterProtocol?
    var networkManager: NetworkServiceProtocol?
}

extension ProductsListInteractor: ProductsListInteractorProtocol {
    func retriveProducts(page: Int) {
        Task {
            do {
                guard let response: ProductsReponse = try await networkManager?.get(endpoint: .productList(page: page)) else {
                    output?.errorOccurred(error: "ProductsReponse is nil")
                    return
                }
                formatter?.parseResponse(response)
                output?.productsListResponsesRetrived()
            } catch {
                output?.errorOccurred(error: error.localizedDescription)
            }
        }
    }
}

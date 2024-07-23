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
    
}

extension ProductsListInteractor: ProductsListInteractorProtocol {
    func retriveProducts(page: Int) {
        Task {
            do {
                let response: ProductsReponse = try await NetworkManager.shared.get(endpoint: .productList(page: page))
                formatter?.parseResponse(response)
                output?.productsListResponsesRetrived()
            } catch {
                output?.errorOccurred(error: "")
            }
        }
    }
}

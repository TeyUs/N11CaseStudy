//
//  ProductDetailInteractor.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import Foundation

final class ProductDetailInteractor {
    
    weak var output: ProductDetailInteractorToPresenterProtocol?
    private var productDetailResponse: ProductDetailResponse?
    var networkManager: NetworkServiceProtocol?
}

extension ProductDetailInteractor: ProductDetailInteractorProtocol {
    func retriveProduct(id: Int) {
        Task {
            do {
                guard let response: ProductDetailResponse = try await networkManager?.get(endpoint: .productDetail(id: id)) else {
                    output?.errorOccurred(error: "ProductDetailResponse is nil")
                    return
                }
                self.productDetailResponse = response
                output?.productDetailResponseRetrived()
            } catch {
                output?.errorOccurred(error: error.localizedDescription)
            }
        }
    }
    
    func getProductDetailResponse() -> ProductDetailResponse? {
        productDetailResponse
    }
}

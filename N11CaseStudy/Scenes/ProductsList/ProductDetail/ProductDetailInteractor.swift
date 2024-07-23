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
}

extension ProductDetailInteractor: ProductDetailInteractorProtocol {
    func retriveProduct(id: Int) {
        Task {
            do {
                let response: ProductDetailResponse = try await NetworkManager.shared.get(endpoint: .productDetail(id: id))
                self.productDetailResponse = response
                output?.productDetailResponseRetrived()
            } catch {
                output?.errorOccurred(error: "")
            }
        }
    }
    
    func getProductDetailResponse() -> ProductDetailResponse? {
        productDetailResponse
    }
}

//
//  ProductDetailPresenter.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import Foundation

final class ProductDetailPresenter {
    weak var view: ProductDetailViewProtocol?
    var router: ProductDetailRouterProtocol?
    var interactor: ProductDetailInteractorProtocol?
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
}


extension ProductDetailPresenter: ProductDetailPresenterProtocol {
    func viewDidLoad() {
        interactor?.retriveProduct(id: id)
    }
    
    var imagesItemsCount: Int {
        interactor?.getProductDetailResponse()?.images?.count ?? 0
    }
    
    func imagesItem(at index: IndexPath) -> URL? {
        if let imageStr = interactor?.getProductDetailResponse()?.images?[index.row] {
            return URL(string: imageStr)
        }
        return nil
    }
}


extension ProductDetailPresenter: ProductDetailInteractorToPresenterProtocol {
    func productDetailResponseRetrived() {
        guard let response = interactor?.getProductDetailResponse() else { return }
        view?.setTitle(response.title)
        view?.setDescription(response.description)
        view?.setSeller(response.sellerName)
        if let price = response.price,
           let discountedPrice = response.instantDiscountPrice {
            view?.setPrices(normal: Double(price), discounted: Double(discountedPrice))
        } else {
            errorOccurred(error: "Prices")
        }
    }
    
    func errorOccurred(error: String) {
        
    }
}
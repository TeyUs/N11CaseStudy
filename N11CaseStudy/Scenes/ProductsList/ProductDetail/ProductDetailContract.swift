//
//  ProductDetailContract.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import Foundation

protocol ProductDetailViewProtocol: AnyObject {
    func reloadImageSlider()
    func setTitle(_ text: String?)
    func setPageControllerNumberOfPages(_ total: Int)
    func setPageController(_ currentPage: Int)
    func setRateView(_ rate: Double)
    func setDescription(_ text: String?)
    func setPrices(normal: Double, discounted: Double)
    func setSeller(_ text: String?)
}

protocol ProductDetailPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol ProductDetailAdapterToPresenterProtocol: AnyObject {
    var imagesItemsCount: Int { get }
    func imagesItem(at index: IndexPath) -> URL?
    func pageControllerChanged(to currentPage: Int)
}

protocol ProductDetailInteractorProtocol: AnyObject {
    func retriveProduct(id: Int)
    func getProductDetailResponse() -> ProductDetailResponse?
}

protocol ProductDetailInteractorToPresenterProtocol: AnyObject {
    func productDetailResponseRetrived()
    func errorOccurred(error: String)
}

protocol ProductDetailRouterProtocol: AnyObject {
    
}


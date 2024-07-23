//
//  ProductDetailContract.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import Foundation

//presenter'da, view'ı yönetecek
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

//view'daki ve adapter'deki presenter
protocol ProductDetailPresenterProtocol: AnyObject {
    func viewDidLoad()
    var imagesItemsCount: Int { get }
    func imagesItem(at index: IndexPath) -> URL?
    func pageControllerChanged(to currentPage: Int)
}

//presenter'daki interactor
protocol ProductDetailInteractorProtocol: AnyObject {
    func retriveProduct(id: Int)
    func getProductDetailResponse() -> ProductDetailResponse?
}

//interactor'daki presenter
protocol ProductDetailInteractorToPresenterProtocol: AnyObject {
    func productDetailResponseRetrived()
    func errorOccurred(error: String)
}

//presenter'da
protocol ProductDetailRouterProtocol: AnyObject {
    
}


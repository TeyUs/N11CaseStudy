//
//  MockProductDetailInteractor.swift
//  N11CaseStudyTests
//
//  Created by Teyhan Uslu on 25.07.2024.
//

import Foundation
@testable import N11CaseStudy

final class MockProductDetailInteractor: ProductDetailInteractorProtocol {
    var demoResponse = ProductDetailResponse(title: "title1", description: "description1",
                                             images: ["https://n11scdn.akamaized.net/a1/{0}/elektronik/cep-telefonu/apple-iphone-12-pro-max-128-gb-apple-turkiye-garantili__1395747226606678.jpg", "notURL"],
                                             price: 1, instantDiscountPrice: 1, rate: 4, sellerName: "sellerName")
    
    var demoResponseNilImages = ProductDetailResponse(title: "title1", description: "description1",
                                             images: nil,
                                             price: 1, instantDiscountPrice: 1, rate: 4, sellerName: "sellerName")
    var demoResponseNilPrice = ProductDetailResponse(title: "title1", description: "description1",
                                             images: nil,
                                             price: nil, instantDiscountPrice: 1, rate: 4, sellerName: "sellerName")
    
    
    var retriveProductCalled = false
    var retriveProductCallCount = 0
    func retriveProduct(id: Int) {
        retriveProductCalled = true
        retriveProductCallCount += 1
    }
    
    var getProductDetailResponseCalled = false
    var getProductDetailResponseCallCount = 0
    func getProductDetailResponse() -> N11CaseStudy.ProductDetailResponse? {
        getProductDetailResponseCalled = true
        getProductDetailResponseCallCount += 1
        
        return demoResponse
    }
}
    

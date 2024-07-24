//
//  MockProductDetailPresenter.swift
//  N11CaseStudyTests
//
//  Created by Teyhan Uslu on 25.07.2024.
//

@testable import N11CaseStudy

final class MockProductDetailPresenter: ProductDetailInteractorToPresenterProtocol {
    var productDetailResponseRetrivedCalled = false
    var productDetailResponseRetrivedCallCount = 0
    func productDetailResponseRetrived() {
        productDetailResponseRetrivedCalled = true
        productDetailResponseRetrivedCallCount += 1
    }
    
    var errorOccurredCalled = false
    var errorOccurredCallCount = 0
    func errorOccurred(error: String) {
        errorOccurredCalled = true
        errorOccurredCallCount += 1
    }
    
    
}

//
//  MockProductDetailView.swift
//  N11CaseStudyTests
//
//  Created by Teyhan Uslu on 25.07.2024.
//

import Foundation
@testable import N11CaseStudy

final class MockProductDetailView: ProductDetailViewProtocol {
    
    var showAllertCalled = false
    var showAllertCallCount = 0
    func showAllert(message: String, title: String) {
        showAllertCalled = true
        showAllertCallCount += 1
    }
    
    var reloadImageSliderCalled = false
    var reloadImageSliderCallCount = 0
    func reloadImageSlider() {
        reloadImageSliderCalled = true
        reloadImageSliderCallCount += 1
    }
    
    var setTitleCalled = false
    var setTitleCallCount = 0
    func setTitle(_ text: String?) {
        setTitleCalled = true
        setTitleCallCount += 1
    }
    
    var setPageControllerNumberOfPagesCalled = false
    var setPageControllerNumberOfPagesCallCount = 0
    func setPageControllerNumberOfPages(_ total: Int) {
        setPageControllerNumberOfPagesCalled = true
        setPageControllerNumberOfPagesCallCount += 1
    }
    
    var setPageControllerCalled = false
    var setPageControllerCallCount = 0
    func setPageController(_ currentPage: Int) {
        setPageControllerCalled = true
        setPageControllerCallCount += 1
    }
    
    var setRateViewCalled = false
    var setRateViewCallCount = 0
    func setRateView(_ rate: Double) {
        setRateViewCalled = true
        setRateViewCallCount += 1
    }
    
    var setDescriptionCalled = false
    var setDescriptionCallCount = 0
    func setDescription(_ text: String?) {
        setDescriptionCalled = true
        setDescriptionCallCount += 1
    }
    
    var setPricesCalled = false
    var setPricesCallCount = 0
    func setPrices(normal: Double, discounted: Double) {
        setPricesCalled = true
        setPricesCallCount += 1
    }
    
    var setSellerCalled = false
    var setSellerCallCount = 0
    func setSeller(_ text: String?) {
        setSellerCalled = true
        setSellerCallCount += 1
    }
    
    
    
    
    
}

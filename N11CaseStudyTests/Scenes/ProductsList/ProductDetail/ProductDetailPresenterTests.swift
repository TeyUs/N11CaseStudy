//
//  ProductDetailPresenterTests.swift
//  N11CaseStudyTests
//
//  Created by Teyhan Uslu on 25.07.2024.
//

import XCTest
@testable import N11CaseStudy

final class ProductDetailPresenterTests: XCTestCase {
    private var presenter: ProductDetailPresenter!
    private var view: MockProductDetailView!
    private var interactor: MockProductDetailInteractor!

    override func setUp() {
        super.setUp()
        presenter = ProductDetailPresenter(id: 0)
        view = MockProductDetailView()
        interactor = MockProductDetailInteractor()
        presenter.view = view
        presenter.interactor = interactor
    }
    
    func test_viewDidLoad_callsRetriveProductCalled() {
        XCTAssertFalse(interactor.retriveProductCalled)
        
        presenter.viewDidLoad()
        
        XCTAssertEqual(interactor.retriveProductCallCount, 1)
    }
    
    func test_imagesItemsCount_returns2() {
        XCTAssertEqual(presenter.imagesItemsCount, interactor.demoResponse.images?.count)
    }
    
    func test_imagesItem_returnsURL() {
        
        let url = presenter.imagesItem(at: .init(row: 0, section: 0))
        
        XCTAssertNotNil(url)
    }
    
    func test_imagesItem_withInvalidURL_callserrorOccurredAndReturnsNil() {
        XCTAssertFalse(view.showAllertCalled)
        interactor.demoResponse = interactor.demoResponseNilImages
        
        let url = presenter.imagesItem(at: .init(row: 1, section: 0))
        
        XCTAssertNil(url)
        XCTAssertEqual(view.showAllertCallCount, 1)
    }
    
    func test_pageControllerChanged_callsSetPageController() {
        XCTAssertFalse(view.setPageControllerCalled)
        
        presenter.pageControllerChanged(to: 1)
        
        XCTAssertEqual(view.setPageControllerCallCount, 1)
    }
    
    func test_productDetailResponseRetrived_responseIsNil_callsErrorOccurred() {
        XCTAssertFalse(view.showAllertCalled)
        presenter.interactor = nil
        
        presenter.productDetailResponseRetrived()
        
        XCTAssertEqual(view.showAllertCallCount, 1)
        XCTAssertFalse(view.reloadImageSliderCalled)
        XCTAssertFalse(view.setPageControllerNumberOfPagesCalled)
        XCTAssertFalse(view.setTitleCalled)
        XCTAssertFalse(view.setRateViewCalled)
        XCTAssertFalse(view.setDescriptionCalled)
        XCTAssertFalse(view.setSellerCalled)
        XCTAssertFalse(view.setPricesCalled)
    }
    
    func test_productDetailResponseRetrived_callsViewMethods() {
        XCTAssertFalse(view.showAllertCalled)
        XCTAssertFalse(view.reloadImageSliderCalled)
        XCTAssertFalse(view.setPageControllerNumberOfPagesCalled)
        XCTAssertFalse(view.setTitleCalled)
        XCTAssertFalse(view.setRateViewCalled)
        XCTAssertFalse(view.setDescriptionCalled)
        XCTAssertFalse(view.setSellerCalled)
        XCTAssertFalse(view.setPricesCalled)
        
        presenter.productDetailResponseRetrived()
        
        XCTAssertEqual(view.reloadImageSliderCallCount, 1)
        XCTAssertEqual(view.setPageControllerNumberOfPagesCallCount, 1)
        XCTAssertEqual(view.setTitleCallCount, 1)
        XCTAssertEqual(view.setRateViewCallCount, 1)
        XCTAssertEqual(view.setDescriptionCallCount, 1)
        XCTAssertEqual(view.setSellerCallCount, 1)
        XCTAssertEqual(view.setPricesCallCount, 1)
    }
    
    func test_productDetailResponseRetrived_priceIsNil_callsViewMethods() {
        XCTAssertFalse(view.showAllertCalled)
        XCTAssertFalse(view.reloadImageSliderCalled)
        XCTAssertFalse(view.setPageControllerNumberOfPagesCalled)
        XCTAssertFalse(view.setTitleCalled)
        XCTAssertFalse(view.setRateViewCalled)
        XCTAssertFalse(view.setDescriptionCalled)
        XCTAssertFalse(view.setSellerCalled)
        XCTAssertFalse(view.setPricesCalled)
        interactor.demoResponse = interactor.demoResponseNilPrice
        
        presenter.productDetailResponseRetrived()
        
        XCTAssertFalse(view.setPricesCalled)
        XCTAssertEqual(view.showAllertCallCount, 1)
        XCTAssertEqual(view.reloadImageSliderCallCount, 1)
        XCTAssertEqual(view.setPageControllerNumberOfPagesCallCount, 1)
        XCTAssertEqual(view.setTitleCallCount, 1)
        XCTAssertEqual(view.setRateViewCallCount, 1)
        XCTAssertEqual(view.setDescriptionCallCount, 1)
        XCTAssertEqual(view.setSellerCallCount, 1)
    }
    
    
    func test_errorOccurred_callsShowAllert() {
        XCTAssertFalse(view.showAllertCalled)
        
        presenter.errorOccurred(error: "")
        
        XCTAssertEqual(view.showAllertCallCount, 1)
    }
    
}

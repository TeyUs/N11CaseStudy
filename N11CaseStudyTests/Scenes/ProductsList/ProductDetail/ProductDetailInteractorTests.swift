//
//  ProductDetailInteractorTests.swift
//  N11CaseStudyTests
//
//  Created by Teyhan Uslu on 24.07.2024.
//

import XCTest
@testable import N11CaseStudy

final class ProductDetailInteractorTests: XCTestCase {
    private var interactor: ProductDetailInteractor!
    private var output: MockProductDetailPresenter!
    private var networkManager: MockNetworkService!

    override func setUp() {
        super.setUp()
        interactor = ProductDetailInteractor()
        output = MockProductDetailPresenter()
        networkManager = MockNetworkService()
        interactor.output = output
        interactor.networkManager = networkManager
    }
    
    func test_retriveProduct_networkManagerIsNil_errorOccurred() async throws {
        XCTAssertFalse(output.productDetailResponseRetrivedCalled)
        interactor.networkManager = nil
        
        interactor.retriveProduct(id: 0)
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 sec
        
        XCTAssertTrue(output.errorOccurredCalled)
        XCTAssertEqual(output.errorOccurredCallCount, 1)
    }
    
    func test_retriveProduct_productDetailResponseRetrived() async throws {
        XCTAssertFalse(output.productDetailResponseRetrivedCalled)
        
        interactor.retriveProduct(id: 0)
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 sec
        
        XCTAssertTrue(output.productDetailResponseRetrivedCalled)
        XCTAssertEqual(output.productDetailResponseRetrivedCallCount, 1)
    }

    func test_retriveProduct_throwsError_errorOccurred() async throws {
        XCTAssertFalse(output.productDetailResponseRetrivedCalled)
        networkManager.willErrorThrow = true
        
        interactor.retriveProduct(id: 0)
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 sec
        
        XCTAssertTrue(output.errorOccurredCalled)
        XCTAssertEqual(output.errorOccurredCallCount, 1)
    }
    
    func test_getProductDetailResponse() async throws {
        interactor.retriveProduct(id: 0)
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1 sec
        
        let response = interactor.getProductDetailResponse()
        
        XCTAssertEqual(response, networkManager.demoResponse)
    }
}

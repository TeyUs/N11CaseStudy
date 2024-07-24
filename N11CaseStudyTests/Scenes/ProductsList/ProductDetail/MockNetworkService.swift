//
//  MockNetworkService.swift
//  N11CaseStudyTests
//
//  Created by Teyhan Uslu on 25.07.2024.
//

import Foundation
@testable import N11CaseStudy

final class MockNetworkService: NetworkServiceProtocol {
    
    
    var demoResponse = ProductDetailResponse(title: "title1", description: "description1", images: ["image1", "image2"], price: 1, instantDiscountPrice: 1, rate: 4, sellerName: "sellerName")
    var willErrorThrow = false
    
    var getCalled = false
    var getCallCount = 0
    func get<T>(endpoint: N11CaseStudy.API.Endpoint) async throws -> T where T : Decodable {
        getCalled = true
        getCallCount += 1
        
        if willErrorThrow {
            throw NSError.init(domain: "Test", code: 1)
        }
        return demoResponse as! T
    }
}

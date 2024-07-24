//
//  ProdcutDetailResponse.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 22.07.2024.
//

import Foundation

// MARK: - ProdcutDetailResponse
struct ProductDetailResponse: Codable, Equatable {
    let title: String?
    let description: String?
    let images: [String]?
    let price: Int?
    let instantDiscountPrice: Int?
    let rate: Double?
    let sellerName: String?
}

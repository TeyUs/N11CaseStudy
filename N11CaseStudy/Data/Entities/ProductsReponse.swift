//
//  ProductsReponse.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 20.07.2024.
//

import Foundation

// MARK: - ProductsReponse
struct ProductsReponse: Codable {
    let page: String?
    let nextPage: String?
    let publishedAt: String?
    let sponsoredProducts: [Product]?
    let products: [Product]?

    enum CodingKeys: String, CodingKey {
        case page
        case nextPage
        case publishedAt = "published_at"
        case sponsoredProducts
        case products
    }
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let price: Double?
    let instantDiscountPrice: Double?
    let rate: Double?
    let sellerName: String?
}

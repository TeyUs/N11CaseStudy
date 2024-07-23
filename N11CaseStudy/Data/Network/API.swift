//
//  API.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 20.07.2024.
//

import Foundation

struct API {
    static let baseURL = "https://private-d3ae2-n11case.apiary-mock.com/"
    
    enum Endpoint {
        case productList(page: Int)
        case productDetail(id: Int)
        
        var endpoint: String {
            switch self {
            case .productList(page: let page):
                "listing/\(page)"
            case .productDetail(id: let id):
                "product?productId=\(id)"
            }
        }
        
        var url: String {
            return "\(API.baseURL)\(endpoint)"
        }
    }
}

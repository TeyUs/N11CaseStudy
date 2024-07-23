//
//  ProductListFormatter.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 23.07.2024.
//

import Foundation


final class ProductListFormatter {
    private var normalProducts: [Product] = []
    private var sponsoredProducts: [Product] = []
    private(set) var nextPage: Int? = 1
}


extension ProductListFormatter: ProductListFormatterProtocol {
    func parseResponse(_ response: ProductsReponse) {
        if let newNormalProducts = response.products {
            normalProducts.append(contentsOf: newNormalProducts)
        }
        if let newSponsoredProducts = response.sponsoredProducts {
            sponsoredProducts.append(contentsOf: newSponsoredProducts)
        }
        
        if let nextPageStr = response.nextPage {
            nextPage = Int(nextPageStr)
        } else {
            nextPage = nil
        }
    }
    
    var getNormalProductsItemsCount: Int {
        normalProducts.count
    }
    
    func getNormalProductsItem(at index: Int) -> Product {
        normalProducts[index]
    }
    
    
    var getSponsoredProductsItemsCount: Int {
        sponsoredProducts.count
    }
    
    func getSponsoredProductsItem(at index: Int) -> Product {
        sponsoredProducts[index]
    }
}

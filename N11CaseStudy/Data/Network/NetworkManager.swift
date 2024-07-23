//
//  NetworkManager.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 20.07.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func get<T: Decodable>(endpoint: API.Endpoint) async throws -> T
}

final class NetworkManager: NetworkServiceProtocol {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    enum NetworkError: Error {
        case badURL
        case requestFailed
        case unknown
    }
    
    func get<T: Decodable>(endpoint: API.Endpoint) async throws -> T {
        guard let url = URL(string: endpoint.url) else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        
        do {
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            return decodedObject
        } catch {
            throw NetworkError.unknown
        }
    }
}

//
//  Network.swift
//  StanceTestSwiftUI
//
//  Created by Pau Ruiz Perez on 22/08/2024.
//

import Foundation
import Combine

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
}

enum APIError: Error {
    case invalidResponse
    case invalidData
}

enum NetworkEndpoints: APIEndpoint {
    case getData
    
    var baseURL: URL {
        return URL(string: "https://run.mocky.io/")!
    }
    
    var path: String {
        switch self {
        case .getData:
            return "/v3/541fe76b-7ff1-48cf-90a3-bb145a300d6d"
        }
    }

}

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}

class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}

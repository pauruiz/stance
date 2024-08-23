//
//  NetworkService.swift
//  StanceTestSwiftUI
//
//  Created by Pau Ruiz Perez on 22/08/2024.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func getData() -> AnyPublisher<GymData, Error>
}

class NetworkService: NetworkServiceProtocol {
    let apiClient = URLSessionAPIClient<NetworkEndpoints>()
    
    func getData() -> AnyPublisher<GymData, Error> {
        return apiClient.request(.getData)
    }
}

//
//  RepsViewModel.swift
//  StanceTestSwiftUI
//
//  Created by Pau Ruiz Perez on 22/08/2024.
//

import Foundation
import Combine

class RepsViewModel: ObservableObject {
    private var cancellables = Array<AnyCancellable>()
    let networkService:NetworkServiceProtocol
    @Published var data: [GymData] = []
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchData() {
        self.networkService.getData()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {data in }, receiveValue: { [weak self] data in
                self?.data = data
            }).store(in: &cancellables)
    }
    func fetchDataNoNetwork() {
        let dataForTestProvider = GymDataForTest()
        self.data = dataForTestProvider.getData()
    }
}

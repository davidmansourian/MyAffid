//
//  APIService.swift
//  BreathingCircle
//
//  Created by David on 2022-12-03.
//

import Foundation
import Combine



class APIService{
    static let shared = APIService()
    @Published var quotesArr: [QuotesModel] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        getData()
    }
    
    func getData(){
        let urlString = "https://type.fit/api/quotes"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else{
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: [QuotesModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case.finished:
                    print("\(completion) data from the API")
                case.failure(let error):
                    print("Couldn't get data from API, \(error)")
                }
            } receiveValue: { [weak self] data in
                self?.quotesArr = data
            }.store(in: &cancellables)
    }
}

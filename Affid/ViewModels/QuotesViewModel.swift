//
//  QuotesViewModel.swift
//  BreathingCircle
//
//  Created by David on 2022-12-05.
//

import Foundation
import Combine


class QuotesViewModel: ObservableObject{
    private var apiService = APIService()
    @Published var randomQuote: QuotesModel?
    @Published var totalCompletedMeditations: Int?
    private var cancellables = Set<AnyCancellable>()
    
    func getQuote(){
        apiService.$quotesArr
            .sink { [weak self] data in
                self?.randomQuote = data.randomElement()
            }.store(in: &cancellables)
    }
    
    func getTotalMeditationsCompleted(){
        totalCompletedMeditations = coreDataManager.countTotalTimesMeditated()
    }
    
}

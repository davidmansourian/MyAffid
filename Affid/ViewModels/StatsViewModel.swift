//
//  StatsViewModel.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import Foundation


class StatsViewModel: ObservableObject{
    private var coreDataManager = CoreDataManager.shared
    @Published var totalCompletedMeditations: Int = 0
    @Published var totalMeditations: Int = 0
    @Published var favoriteMeditation: String = ""
    
    
    func getTotalMeditationsCompleted(){
        totalCompletedMeditations = coreDataManager.countTotalTimesMeditatedCompleted()
    }
    
    func getTotalMeditations(){
        totalMeditations = coreDataManager.countTotalTimesMeditated()
    }
    
    func getFavoriteMeditation(){
        if coreDataManager.countMeditations(meditationType: "regular") > 0{
            favoriteMeditation = "Regular timer based"
        }
        else{
            favoriteMeditation = "No favorite yet"
        }
    }
}

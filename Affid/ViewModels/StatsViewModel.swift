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
    
    // First bar chart preview:
    // Total sessions (including all meditation sessions) per day / week
    // Clicking on it will reveal a picker to sort by month and year as well
    
    
    
    
    func getTotalMeditationsCompleted(){ // get number of total meditations, get session type, session
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

//
//  TimerViewModel.swift
//  BreathingCircle
//
//  Created by David on 2022-12-02.
//

import Foundation
import Combine


class TimerViewModel: ObservableObject{
    var networkManager = NetworkManager()
    @Published var pickerArr: [TimerModel] = []
    @Published var picked: Int = 1
    @Published var pickedInSeconds: Int = 0
    @Published var time: String = "10:00"
    @Published var showingAlert: Bool = false
    @Published var isActive = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var minutes: Float?{
        didSet{
            self.time = "\(Int(minutes ?? 99)):00"
        }
    }
    private var cancellable: Cancellable?
    private var initialTime = 1
    private var endDate = Date()
    private var totalTimeRemaining: Int = 0
    private var meditationType: String = "Regular"
    
    init(){
        loadPickerWithMinutes()
        
        cancellable = $picked
            .sink { [weak self] theMinute in
                guard let self = self else { return }
                self.minutes = Float(theMinute)
                self.pickedInSeconds = theMinute*60
            }
    }
    
    
    func loadPickerWithMinutes(){
        for theMinute in 1...60{
            pickerArr.append(TimerModel(id: theMinute, number: theMinute, text: "min"))
        }
    }
    
    
    func startTimer(){
        self.initialTime = Int(minutes ?? 99)
        self.endDate = Date()
        self.isActive = true
        self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes ?? 99), to: endDate)!
    }
    
    func reset(){
        let now = Date()
        let timeMeditated = self.pickedInSeconds - totalTimeRemaining
        if networkManager.isConnected{
            CoreDataManager.shared.saveSession(type: self.meditationType, length: timeMeditated, completed: false, theDate: now)
        }
        print("saved session")
        self.minutes = Float(initialTime)
        self.isActive = false
    }
    
    func updateCountdownw(){
        guard isActive else { return }
        
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        
        if diff <= 0{
            self.isActive = false
            if networkManager.isConnected{
                CoreDataManager.shared.saveSession(type: self.meditationType, length: self.pickedInSeconds, completed: true, theDate: now)
            }
            self.time = "0:00"
            self.showingAlert = true
            return
        }
        
        let date = Date(timeIntervalSince1970: diff)
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        print(seconds)
        
        self.totalTimeRemaining = minutes*60 + seconds
        self.minutes = Float(minutes)
        self.time = String(format: "%d:%02d", minutes, seconds)
        
        
    }
    
}


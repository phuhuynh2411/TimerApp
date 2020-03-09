//
//  TimeManager.swift
//  TimerApp
//
//  Created by Huynh Tan Phu on 3/6/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

import SwiftUI

fileprivate let timerLengthKey = "timerLength"

class TimeManager: ObservableObject {
    @Published var timeMode: TimeMode = .initial
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: timerLengthKey)
    
    var timer = Timer()
    
    func start() {
        timeMode = .running
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.secondsLeft <= 0 {
                self.reset()
            }
            self.secondsLeft -= 1
        }
    }
    
    func reset() {
        timeMode = .initial
        secondsLeft = UserDefaults.standard.integer(forKey: timerLengthKey)
        timer.invalidate()
    }
    
    func pause() {
        timeMode = .paused
        timer.invalidate()
    }
    
    func setTimerLength(seconds: Int) {
        let userDefault = UserDefaults.standard
        userDefault.set(seconds, forKey: timerLengthKey)
        
        self.secondsLeft = seconds
    }
    
    var displayedSeconds: String {
        secondsToMinutesAndSeconds(seconds: secondsLeft)
    }
}

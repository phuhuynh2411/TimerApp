//
//  Helper.swift
//  TimerApp
//
//  Created by Huynh Tan Phu on 3/6/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

enum TimeMode {
    case running
    case paused
    case initial
}

func secondsToMinutesAndSeconds(seconds: Int) -> String {
    let minuteString = "\(seconds/60)"
    let secondString = "\(seconds % 60)"

    let displayedMins = minuteString.count > 1 ? minuteString : "0\(minuteString)"
    let displayedSecs = secondString.count > 1 ? secondString : "0\(secondString)"

    return "\(displayedMins):\(displayedSecs)"
}

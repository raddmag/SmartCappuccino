//
//  RepeatingTimer.swift
//  Cappuccino
//
//  Created by Mario Garcia on 10/13/18.
//  Copyright © 2018 Mario Garcia. All rights reserved.
//

import Foundation

class RepeatingTimer : NSObject {
    var isRepeatingTimerRunning = false
    var isStartTimerRunning = false
    var target : NSObject
    var selector :  Selector
    var initialTimer : Timer = Timer()
    var repeatingTimer : Timer = Timer()
    var interval : TimeInterval
    
    init(interval : TimeInterval, target: NSObject, selector: Selector) {
        self.interval = interval
        self.target = target
        self.selector = selector
    }
    
    func start(initialCountdown : TimeInterval) {
        if (isStartTimerRunning || isRepeatingTimerRunning) {
            return
        }
        isStartTimerRunning = true
        initialTimer = Timer.scheduledTimer(timeInterval: initialCountdown, target: self, selector: (#selector(RepeatingTimer.resetTimer)), userInfo: nil, repeats: false)
    }
    
    
    func cancel() {
        if (!isStartTimerRunning && !isRepeatingTimerRunning) {
            return
        }
        isStartTimerRunning = false
        isRepeatingTimerRunning = false
        
        initialTimer.invalidate()
        repeatingTimer.invalidate()
    }
    
    @objc func resetTimer() {
        target.perform(selector)
        isStartTimerRunning = false
        isRepeatingTimerRunning = true
        repeatingTimer = Timer.scheduledTimer(
            timeInterval: interval,
            target: self,
            selector: (#selector(RepeatingTimer.resetTimer)),
            userInfo: nil,
            repeats: true
        )
    }
}

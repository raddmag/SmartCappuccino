//
//  CappuccinoViewController.swift
//  Cappuccino
//
//  Created by Mario Garcia on 10/13/18.
//  Copyright © 2018 Mario Garcia. All rights reserved.
//

import Cocoa

let SECOND : TimeInterval = 1
let MINUTE : TimeInterval = 60 * SECOND
let HOUR : TimeInterval = 60 * MINUTE
let DAY : TimeInterval = 24 * HOUR

enum Item : NSInteger {
    case NotSelected = 0
    case Selected
}

class CappuccinoViewController: NSViewController {
    private let alarmTimes12Hour = [
        "12:00 am", "12:05 am", "12:10 am", "12:15 am", "12:20 am", "12:25 am", "12:30 am", "12:35 am", "12:40 am", "12:45 am", "12:50 am", "12:55 am",
        "1:00 am", "1:05 am", "1:10 am", "1:15 am", "1:20 am", "1:25 am", "1:30 am", "1:35 am", "1:40 am", "1:45 am", "1:50 am", "1:55 am",
        "2:00 am", "2:05 am", "2:10 am", "2:15 am", "2:20 am", "2:25 am", "2:30 am", "2:35 am", "2:40 am", "2:45 am", "2:50 am", "2:55 am",
        "3:00 am", "3:05 am", "3:10 am", "3:15 am", "3:20 am", "3:25 am", "3:30 am", "3:35 am", "3:40 am", "3:45 am", "3:50 am", "3:55 am",
        "4:00 am", "4:05 am", "4:10 am", "4:15 am", "4:20 am", "4:25 am", "4:30 am", "4:35 am", "4:40 am", "4:45 am", "4:50 am", "4:55 am",
        "5:00 am", "5:05 am", "5:10 am", "5:15 am", "5:20 am", "5:25 am", "5:30 am", "5:35 am", "5:40 am", "5:45 am", "5:50 am", "5:55 am",
        "6:00 am", "6:05 am", "6:10 am", "6:15 am", "6:20 am", "6:25 am", "6:30 am", "6:35 am", "6:40 am", "6:45 am", "6:50 am", "6:55 am",
        "7:00 am", "7:05 am", "7:10 am", "7:15 am", "7:20 am", "7:25 am", "7:30 am", "7:35 am", "7:40 am", "7:45 am", "7:50 am", "7:55 am",
        "8:00 am", "8:05 am", "8:10 am", "8:15 am", "8:20 am", "8:25 am", "8:30 am", "8:35 am", "8:40 am", "8:45 am", "8:50 am", "8:55 am",
        "9:00 am", "9:05 am", "9:10 am", "9:15 am", "9:20 am", "9:25 am", "9:30 am", "9:35 am", "9:40 am", "9:45 am", "9:50 am", "9:55 am",
        "10:00 am", "10:05 am", "10:10 am", "10:15 am", "10:20 am", "10:25 am", "10:30 am", "10:35 am", "10:40 am", "10:45 am", "10:50 am", "10:55 am",
        "11:00 am", "11:05 am", "11:10 am", "11:15 am", "11:20 am", "11:25 am", "11:30 am", "11:35 am", "11:40 am", "11:45 am", "11:50 am", "11:55 am",
        "12:00 pm", "12:05 pm", "12:10 pm", "12:15 pm", "12:20 pm", "12:25 pm", "12:30 pm", "12:35 pm", "12:40 pm", "12:45 pm", "12:50 pm", "12:55 pm",
        "1:00 pm", "1:05 pm", "1:10 pm", "1:15 pm", "1:20 pm", "1:25 pm", "1:30 pm", "1:35 pm", "1:40 pm", "1:45 pm", "1:50 pm", "1:55 pm",
        "2:00 pm", "2:05 pm", "2:10 pm", "2:15 pm", "2:20 pm", "2:25 pm", "2:30 pm", "2:35 pm", "2:40 pm", "2:45 pm", "2:50 pm", "2:55 pm",
        "3:00 pm", "3:05 pm", "3:10 pm", "3:15 pm", "3:20 pm", "3:25 pm", "3:30 pm", "3:35 pm", "3:40 pm", "3:45 pm", "3:50 pm", "3:55 pm",
        "4:00 pm", "4:05 pm", "4:10 pm", "4:15 pm", "4:20 pm", "4:25 pm", "4:30 pm", "4:35 pm", "4:40 pm", "4:45 pm", "4:50 pm", "4:55 pm",
        "5:00 pm", "5:05 pm", "5:10 pm", "5:15 pm", "5:20 pm", "5:25 pm", "5:30 pm", "5:35 pm", "5:40 pm", "5:45 pm", "5:50 pm", "5:55 pm",
        "6:00 pm", "6:05 pm", "6:10 pm", "6:15 pm", "6:20 pm", "6:25 pm", "6:30 pm", "6:35 pm", "6:40 pm", "6:45 pm", "6:50 pm", "6:55 pm",
        "7:00 pm", "7:05 pm", "7:10 pm", "7:15 pm", "7:20 pm", "7:25 pm", "7:30 pm", "7:35 pm", "7:40 pm", "7:45 pm", "7:50 pm", "7:55 pm",
        "8:00 pm", "8:05 pm", "8:10 pm", "8:15 pm", "8:20 pm", "8:25 pm", "8:30 pm", "8:35 pm", "8:40 pm", "8:45 pm", "8:50 pm", "8:55 pm",
        "9:00 pm", "9:05 pm", "9:10 pm", "9:15 pm", "9:20 pm", "9:25 pm", "9:30 pm", "9:35 pm", "9:40 pm", "9:45 pm", "9:50 pm", "9:55 pm",
        "10:00 pm", "10:05 pm", "10:10 pm", "10:15 pm", "10:20 pm", "10:25 pm", "10:30 pm", "10:35 pm", "10:40 pm", "10:45 pm", "10:50 pm", "10:55 pm",
        "11:00 pm", "11:05 pm", "11:10 pm", "11:15 pm", "11:20 pm", "11:25 pm", "11:30 pm", "11:35 pm", "11:40 pm", "11:45 pm", "11:50 pm", "11:55 pm"
    ]
    
    private let alarmTimes24Hour = [
        "00:00", "00:05", "00:10", "00:15", "00:20", "00:25", "00:30", "00:35", "00:40", "00:45", "00:50", "00:55",
        "01:00", "01:05", "01:10", "01:15", "01:20", "01:25", "01:30", "01:35", "01:40", "01:45", "01:50", "01:55",
        "02:00", "02:05", "02:10", "02:15", "02:20", "02:25", "02:30", "02:35", "02:40", "02:45", "02:50", "02:55",
        "03:00", "03:05", "03:10", "03:15", "03:20", "03:25", "03:30", "03:35", "03:40", "03:45", "03:50", "03:55",
        "04:00", "04:05", "04:10", "04:15", "04:20", "04:25", "04:30", "04:35", "04:40", "04:45", "04:50", "04:55",
        "05:00", "05:05", "05:10", "05:15", "05:20", "05:25", "05:30", "05:35", "05:40", "05:45", "05:50", "05:55",
        "06:00", "06:05", "06:10", "06:15", "06:20", "06:25", "06:30", "06:35", "06:40", "06:45", "06:50", "06:55",
        "07:00", "07:05", "07:10", "07:15", "07:20", "07:25", "07:30", "07:35", "07:40", "07:45", "07:50", "07:55",
        "08:00", "08:05", "08:10", "08:15", "08:20", "08:25", "08:30", "08:35", "08:40", "08:45", "08:50", "08:55",
        "09:00", "09:05", "09:10", "09:15", "09:20", "09:25", "09:30", "09:35", "09:40", "09:45", "09:50", "09:55",
        "10:00", "10:05", "10:10", "10:15", "10:20", "10:25", "10:30", "10:35", "10:40", "10:45", "10:50", "10:55",
        "11:00", "11:05", "11:10", "11:15", "11:20", "11:25", "11:30", "11:35", "11:40", "11:45", "11:50", "11:55",
        "12:00", "12:05", "12:10", "12:15", "12:20", "12:25", "12:30", "12:35", "12:40", "12:45", "12:50", "12:55",
        "13:00", "13:05", "13:10", "13:15", "13:20", "13:25", "13:30", "13:35", "13:40", "13:45", "13:50", "13:55",
        "14:00", "14:05", "14:10", "14:15", "14:20", "14:25", "14:30", "14:35", "14:40", "14:45", "14:50", "14:55",
        "15:00", "15:05", "15:10", "15:15", "15:20", "15:25", "15:30", "15:35", "15:40", "15:45", "15:50", "15:55",
        "16:00", "16:05", "16:10", "16:15", "16:20", "16:25", "16:30", "16:35", "16:40", "16:45", "16:50", "16:55",
        "17:00", "17:05", "17:10", "17:15", "17:20", "17:25", "17:30", "17:35", "17:40", "17:45", "17:50", "17:55",
        "18:00", "18:05", "18:10", "18:15", "18:20", "18:25", "18:30", "18:35", "18:40", "18:45", "18:50", "18:55",
        "19:00", "19:05", "19:10", "19:15", "19:20", "19:25", "19:30", "19:35", "19:40", "19:45", "19:50", "19:55",
        "20:00", "20:05", "20:10", "20:15", "20:20", "20:25", "20:30", "20:35", "20:40", "20:45", "20:50", "20:55",
        "21:00", "21:05", "21:10", "21:15", "21:20", "21:25", "21:30", "21:35", "21:40", "21:45", "21:50", "21:55",
        "22:00", "22:05", "22:10", "22:15", "22:20", "22:25", "22:30", "22:35", "22:40", "22:45", "22:50", "22:55",
        "23:00", "23:05", "23:10", "23:15", "23:20", "23:25", "23:30", "23:35", "23:40", "23:45", "23:50", "23:55"
    ]
    
    lazy var aboutView: AboutWindow = {
        return AboutWindow()
    }()
    
    @IBAction func aboutAppClicked(_ sender: NSButton) {
        aboutView.showWindow(nil)
    }
    
    private let twentyfourHourOptionsWidth : CGFloat = 77;
    private let twentyfourHourOptionsXPosition : CGFloat = 74;
    private let twelveHourOptionsWidth : CGFloat = 93;
    private let twelveHourOptionsXPosition : CGFloat = 58;
    private var selectedLightAlarm = UserDefaults.standard.integer(forKey: "selectedLightAlarm")
    private var selectedDarkAlarm = UserDefaults.standard.integer(forKey: "selectedDarkAlarm")
    private var isDynamic = UserDefaults.standard.bool(forKey: "isDynamic")
    private var is24Hour = UserDefaults.standard.bool(forKey: "is24Hour")
    private var cappuccino = Cappuccino()
    
    private var lightDynamicTimer = RepeatingTimer(
        interval: 24 * HOUR,
        target: Cappuccino(),
        selector: #selector(Cappuccino.enableLight)
    )
    private var darkDynamicTimer = RepeatingTimer(
        interval: 24 * HOUR,
        target: Cappuccino(),
        selector: #selector(Cappuccino.enableDark)
    )
    
    private func getSelectedHour(selectedAlarm : Int) -> Int {
        let selectedTime = alarmTimes24Hour[selectedAlarm]
        let selectedHour : String = String(selectedTime.prefix(2))
        return Int(selectedHour) ?? 0
    }
    
    private func getSelectedMinute(selectedAlarm : Int) -> Int {
        let selectedTime = alarmTimes24Hour[selectedAlarm]
        let selectedMinute : String = String(selectedTime.suffix(2))
        return Int(selectedMinute) ?? 0
    }
    
    private func getAlarmCountdown(selectedTimeHour : TimeInterval, selectedTimeMinute : TimeInterval) -> TimeInterval {
        let date = Date()
        let calendar = Calendar.current
        let hour : TimeInterval = Double(calendar.component(.hour, from: date))
        let minute: TimeInterval = Double(calendar.component(.minute, from: date))
        
        var hourCountdown : TimeInterval = 0
        var minuteCountdown : TimeInterval = 0
        if (selectedTimeHour < hour) {
            hourCountdown = 24 - (hour - selectedTimeHour)
        } else {
            hourCountdown = selectedTimeHour - hour
        }
        
        if (selectedTimeMinute < minute) {
            hourCountdown -= 1
            minuteCountdown = 60 - (minute - selectedTimeMinute)
        } else {
            minuteCountdown = selectedTimeMinute - minute
        }
        
        if (hourCountdown < 0 && selectedTimeMinute < minute) {
            hourCountdown = 23
        }
        
        return hourCountdown * HOUR + minuteCountdown * MINUTE
    }
    
    private func restartDarkAlarm() {
        let selectedDarkHour = getSelectedHour(selectedAlarm: selectedDarkAlarm)
        let selectedDarkMinute = getSelectedMinute(selectedAlarm: selectedDarkAlarm)
        let countdown = getAlarmCountdown(selectedTimeHour: Double(selectedDarkHour), selectedTimeMinute: Double(selectedDarkMinute))
        
        darkDynamicTimer.cancel()
        darkDynamicTimer.start(initialCountdown: countdown)
    }
    
    private func restartLightAlarm() {
        let selectedLightHour = getSelectedHour(selectedAlarm: selectedLightAlarm)
        let selectedLightMinute = getSelectedMinute(selectedAlarm: selectedLightAlarm)
        let countdown = getAlarmCountdown(selectedTimeHour: Double(selectedLightHour), selectedTimeMinute: Double(selectedLightMinute))
        
        lightDynamicTimer.cancel()
        lightDynamicTimer.start(initialCountdown: countdown)
    }
    
    @IBOutlet weak var lightAlarmOptions: NSPopUpButton!
    @IBAction func lightAlarmUpdated(_ sender: NSPopUpButton) {
        selectedLightAlarm = sender.indexOfSelectedItem
        UserDefaults.standard.set(selectedLightAlarm, forKey: "selectedLightAlarm")
        if (isDynamic) {
            restartLightAlarm()
        }
    }
    
    @IBOutlet weak var darkAlarmOptions: NSPopUpButton!
    @IBAction func darkAlarmUpdated(_ sender: NSPopUpButton) {
        selectedDarkAlarm = sender.indexOfSelectedItem
        UserDefaults.standard.set(selectedDarkAlarm, forKey: "selectedDarkAlarm")
        if (isDynamic) {
            restartDarkAlarm()
        }
    }
    
    @IBOutlet weak var isDynamicButton: NSButton!
    @IBAction func toggleDynamic(_ sender: NSButton) {
        if (sender.integerValue == Item.Selected.rawValue) {
            isDynamic = true
            restartLightAlarm()
            restartDarkAlarm()
        } else {
            isDynamic = false
            lightDynamicTimer.cancel()
            darkDynamicTimer.cancel()
        }
        
        UserDefaults.standard.set(isDynamic, forKey: "isDynamic")
    }
    
    private func updateAlarmOptions(
        alarmOptions : NSPopUpButton,
        updatedXPosition: CGFloat,
        updatedWidth : CGFloat,
        alarmTimes : [String]
    ) {
        let lightFrame = alarmOptions.frame
        alarmOptions.frame = CGRect(
            x: updatedXPosition,
            y: lightFrame.origin.y,
            width: updatedWidth,
            height: lightFrame.size.height
        )
        
        for (index, alarmTime) in alarmTimes.enumerated() {
            alarmOptions.item(at: index)?.title = alarmTime
        }
    }
    
    private func updateAlarmOptionsTo24Hour() {
        is24Hour = true
        updateAlarmOptions(
            alarmOptions: lightAlarmOptions,
            updatedXPosition: twentyfourHourOptionsXPosition,
            updatedWidth: twentyfourHourOptionsWidth,
            alarmTimes: alarmTimes24Hour
        )
        updateAlarmOptions(
            alarmOptions: darkAlarmOptions,
            updatedXPosition: twentyfourHourOptionsXPosition,
            updatedWidth: twentyfourHourOptionsWidth,
            alarmTimes: alarmTimes24Hour
        )
    }
    
    private func updateAlarmOptionsTo12Hour() {
        is24Hour = false
        updateAlarmOptions(
            alarmOptions: lightAlarmOptions,
            updatedXPosition: twelveHourOptionsXPosition,
            updatedWidth: twelveHourOptionsWidth,
            alarmTimes: alarmTimes12Hour
        )
        updateAlarmOptions(
            alarmOptions: darkAlarmOptions,
            updatedXPosition: twelveHourOptionsXPosition,
            updatedWidth: twelveHourOptionsWidth,
            alarmTimes: alarmTimes12Hour
        )
    }
    
    
    @IBOutlet weak var is24HourButton: NSButton!
    @IBAction func toggle24Hour(_ sender: NSButton) {
        if (sender.integerValue == Item.Selected.rawValue) {
            updateAlarmOptionsTo24Hour()
        } else {
            updateAlarmOptionsTo12Hour()
        }
        
        UserDefaults.standard.set(is24Hour, forKey: "is24Hour")
    }
    
    @IBAction func enableLightClicked(_ sender: NSButton) {
        let _ = cappuccino.enableLight()
    }
    
    @IBAction func enableDarkClicked(_ sender: NSButton) {
        let _ = cappuccino.enableDark()
    }
    
    @IBAction func quit(_ sender: NSButton) {
        lightDynamicTimer.cancel()
        darkDynamicTimer.cancel()
        NSApplication.shared.terminate(sender)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alarmTimes = is24Hour ? alarmTimes24Hour : alarmTimes12Hour
        lightAlarmOptions.addItems(withTitles: alarmTimes)
        darkAlarmOptions.addItems(withTitles: alarmTimes)
        
        lightAlarmOptions.selectItem(at: selectedLightAlarm)
        darkAlarmOptions.selectItem(at: selectedDarkAlarm)
        
        if (isDynamic) {
            isDynamicButton.setNextState()
            restartLightAlarm()
            restartDarkAlarm()
        }
        if (is24Hour) {
            updateAlarmOptionsTo24Hour()
            is24HourButton.setNextState()
        } else {
            updateAlarmOptionsTo12Hour()
        }
    }
}

extension CappuccinoViewController {
    static func freshController() -> CappuccinoViewController {
        let storyboardname : NSStoryboard.Name = "Main"
        let storyboard = NSStoryboard(name: storyboardname, bundle: nil)
        let identifier : NSStoryboard.SceneIdentifier = "CappuccinoViewController"
        
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? CappuccinoViewController else {
            fatalError("CappuccinoViewController not found - Check Main.storyboard")
        }
        return viewcontroller
    }
}

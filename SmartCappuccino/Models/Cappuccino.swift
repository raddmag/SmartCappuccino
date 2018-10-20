//
//  Cappuccino.swift
//  Cappuccino
//
//  Created by Mario Garcia on 10/13/18.
//  Copyright © 2018 Mario Garcia. All rights reserved.
//

import Foundation

let PREFIX = "tell application \"System Events\" to tell appearance preferences to"

class Cappuccino : NSObject {
    @objc func enableLight() -> String? {
        return AppleScriptManager.runAppleScript("\(PREFIX) set dark mode to \(false)")
    }
    
    @objc func enableDark() -> String? {
        return AppleScriptManager.runAppleScript("\(PREFIX) set dark mode to \(true)")
    }
    
    func brew() {
        // trigger script in order to prompt user for permissions
        let _ = AppleScriptManager.launchScript(scriptName: "IsDarkMode") ?? false
    }
}

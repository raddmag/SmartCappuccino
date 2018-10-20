//
//  AboutWindow.swift
//  Cappuccino
//
//  Created by Mario Garcia on 10/19/18.
//  Copyright © 2018 Mario Garcia. All rights reserved.
//

import Foundation
import Cocoa

let SOURCE_CODE_URL = "https://github.com/maito94/smart-cappuccino-web"
let BUY_URL = "https://smartcappuccino.io/buy"

class AboutWindow: NSWindowController {
    @IBOutlet weak var appIconImageView: NSImageView!
    
    override var windowNibName: NSNib.Name? {
        return NSNib.Name("AboutWindow")
    }

    @IBOutlet weak var appBuildVersionLabel: NSTextField!
    @IBOutlet weak var appNameLabel: NSTextField!
    

    @IBOutlet weak var appSourceCodeLink: NSButton!
    @IBAction func appSourceCodeLinkClicked(_ sender: Any) {
        let sourceCodeURL : URL = URL.init(string: SOURCE_CODE_URL)!
        NSWorkspace.shared.open(sourceCodeURL)
    }
    
    @IBAction func buy(_ sender: Any) {
        let buyURL : URL = URL.init(string: BUY_URL)!
        NSWorkspace.shared.open(buyURL)
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
        
        appNameLabel.stringValue = "SmartCappuccino"
        appBuildVersionLabel.stringValue = "Version ".appending(AppVersion.fullVersionString() ?? "1.0")
    }
}

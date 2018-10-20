//
//  AppDelegate.swift
//  Cappuccino
//
//  Created by Mario Garcia on 10/13/18.
//  Copyright © 2018 Mario Garcia. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var eventMonitor: EventMonitor?
    let popover = NSPopover()
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let icon = NSImage(named: "StatusIcon")
        icon?.isTemplate = true
        
        if let button = statusItem.button {
            button.image = icon
            button.action = #selector(togglePopover(_:))
        }
        popover.contentViewController = CappuccinoViewController.freshController()
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
            if let strongSelf = self, strongSelf.popover.isShown {
                strongSelf.closePopover(sender: event)
            }
        }
        
        let cappuccino = Cappuccino()
        cappuccino.brew()
    }
    
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: Any?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
        eventMonitor?.start()
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
}

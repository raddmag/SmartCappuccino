//
//  AppVersion.swift
//  Cappuccino
//
//  Created by Mario Garcia on 10/19/18.
//  Copyright © 2018 Mario Garcia. All rights reserved.
//

import Foundation

struct AppVersion {
    static func version() -> String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    static func build() -> String? {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
    
    static func fullVersionString() -> String? {
        guard let version = version() else { return nil }
        guard let build = build() else { return version }
        return "\(version).\(build)"
    }
}
